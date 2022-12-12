
filepath = '../../input/2015/day-3-input.txt'

x, y = 0, 0

santa = [{(x,y): 1}, {(x,y): 1}]

coords = [(0,0), (0,0)]

i = 1

with open(filepath) as f:
    data = f.read()

# data = '^v'
# data = '^>v<'
# data = '^v^v^v^v^v'

for c in data:
    if i % 2 == 1:
        santa_type = 0
    else:
        santa_type = 1

    x, y = coords[santa_type]

    if c == '^':
        y += 1
    elif c == '>':
        x += 1
    elif c == 'v':
        y -= 1
    elif c == '<':
        x -= 1
    else:
        raise ValueError(f'Unknown value symbol {c}')

    coords[santa_type] = [x, y]

    try:
        santa[santa_type][(x,y)] += 1
    except KeyError:
        santa[santa_type][(x,y)] = 1

    i += 1


print(len(dict(santa[0] | santa[1])))
# 2631
