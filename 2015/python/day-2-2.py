
filepath = '../../input/2015/day-2-input.txt'

answer = 0

with open(filepath) as f:
    for line in f:
        items = line.strip().split('x')
        l, w, h = map(lambda x: int(x), items)
        # l, w, h = 2, 3, 4
        # l, w, h = 1, 1, 10
        l, w, h = sorted((l, w, h))
        answer += (l + l + w + w) + (l * w * h)
        # break

print(answer)
# 3737498
