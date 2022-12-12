
import os

year = '2015'

folder = os.path.dirname(__file__)
py_dir = (
    os.path.join(folder, year, 'python'),
    lambda d, i: (f'{d}/day-{i}-{n}.py' for n in (1, 2)),
    '''
day = {{{i}}}

filepath = f'../../input/2015/day-{day}-input.txt'

answer = 0

i = 1

with open(filepath) as f:
    data = f.read()

''',
)
inp_dir = (
    os.path.join(folder, 'input', year),
    lambda d, i: f'{d}/day-{i}-input.txt'
)
transl_dir = (
    os.path.join(folder, 'translate', year),
    lambda d, i: (f'{d}/day-{i}-{n}.txt' for n in (1, 2))
)

# debug
# print(folder, py_dir, inp_dir, transl_dir, sep='\n')

for d in (py_dir, inp_dir, transl_dir):
    for i in range(1, 26):
        afunc = d[1]
        fpaths = afunc(d[0], i)
        if isinstance(fpaths, str):
            fpaths = (fpaths,)
        try:
            templ = d[2]
        except IndexError:
            templ = ''
        for fpath in fpaths:
            if os.path.exists(fpath):
                print(f'{fpath} EXISTS!')
                continue

            if len(templ) > 0:
                # create file with template data
                with open(fpath, 'w') as f:
                    f.write(str.replace(templ, '{{{i}}}', str(i)))
            else:
                # create empty file
                with open(fpath, 'x'):
                    pass
            print(f'{fpath} CREATED!')


