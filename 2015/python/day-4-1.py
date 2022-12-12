
from hashlib import md5

day = 4

filepath = f'../../input/2015/day-{day}-input.txt'

i = 0
res = ''

with open(filepath) as f:
    data = f.read()

# data = 'abcdef' # 609043 # 000001dbbfa...
# data = 'pqrstuv' # 1048970 # 000006136ef...

while not res.startswith('00000'):
    i += 1
    m = md5()
    hash = data + str(i)
    m.update(hash.encode())
    res = m.hexdigest()


print(i)
# 254575
