
filepath = '../../input/2015/day-2-input.txt'

answer = 0

with open(filepath) as f:
    for line in f:
        items = line.strip().split('x')
        l, w, h = map(lambda x: int(x), items)
        # l, w, h = 2, 3, 4
        sides = ((2 * l * w), (2 * w * h), (2 * h * l))
        square = sum(sides)
        # print(square, (min(sides) / 2))
        answer += square + int(min(sides) / 2)
        # break

print(answer)
# 1586300
