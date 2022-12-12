
filepath = '../../input/2015/day-3-input.txt'

x, y = 0, 0

d = {(x,y): 1}

with open(filepath) as f:
    data = f.read()

# data = '>'
# data = '^>v<'
# data = '^v^v^v^v^v'

for c in data:
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

    try:
        d[(x,y)] += 1
    except KeyError:
        d[(x,y)] = 1


print(len(d))
# 2572
