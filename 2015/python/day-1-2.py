
filepath = '../../input/2015/day-1-input.txt'

pos, answer = 0, 0

with open(filepath) as f:
    for c in f.read():
        pos += 1
        if c == '(':
            answer += 1
        else:
            answer -= 1
        # print(pos, answer)
        if answer == -1:
            break

print(pos)
# 1795
