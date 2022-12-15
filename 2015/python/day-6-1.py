
import re

day = 6

filepath = f'../../input/2015/day-{day}-input.txt'

grid = [[False for i in range(1000)] for i in range(1000)]

p = re.compile('(?:turn\s)?((?:on|off)|toggle)\s(\d+),(\d+)\sthrough\s(\d+),(\d+)')

with open(filepath) as f:
    data = f.readlines()

res = 0

for line in data:
    line = line.strip()
    # line = 'turn on 0,0 through 999,999'
    # line = 'turn on 0,0 through 999,0'
    m = p.match(line)
    cmnd, x1, y1, x2, y2 = m.groups()
    x1, y1, x2, y2 = int(x1), int(y1), int(x2), int(y2)
    for x in range(x1, x2+1):
        for y in range(y1, y2+1):
            # print(x, y)
            val = grid[x][y]
            if cmnd == 'on':
                if val:
                    continue
                grid[x][y] = True
                res += 1
            elif cmnd == 'off':
                if not val:
                    continue
                grid[x][y] = False
                if res > 0:
                    res -= 1
            elif cmnd == 'toggle':
                if val:
                    grid[x][y] = False
                    if res > 0:
                        res -= 1
                else:
                    grid[x][y] = True
                    res += 1
            else:
                raise ValueError('unknown command %s' % cmnd)


print(res)
# 569999
