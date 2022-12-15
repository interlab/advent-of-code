
import re

day = 6

filepath = f'../../input/2015/day-{day}-input.txt'

grid = [[0 for i in range(1000)] for i in range(1000)]

p = re.compile('(?:turn\s)?((?:on|off)|toggle)\s(\d+),(\d+)\sthrough\s(\d+),(\d+)')

with open(filepath) as f:
    data = f.readlines()

res = 0

for line in data:
    line = line.strip()
    # line = 'turn on 0,0 through 0,0'
    # line = 'toggle 0,0 through 999,999'
    m = p.match(line)
    cmnd, x1, y1, x2, y2 = m.groups()
    x1, y1, x2, y2 = int(x1), int(y1), int(x2), int(y2)
    for x in range(x1, x2+1):
        for y in range(y1, y2+1):
            # print(x, y)
            val = grid[x][y]
            if cmnd == 'on':
                grid[x][y] += 1
                res += 1
            elif cmnd == 'off':
                if val < 1:
                    continue
                grid[x][y] -= 1
                if res > 0:
                    res -= 1
            elif cmnd == 'toggle':
                grid[x][y] += 2
                res += 2
            else:
                raise ValueError('unknown command %s' % cmnd)


print(res)
# 17836115
