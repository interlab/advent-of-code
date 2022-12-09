
filepath = '../../input/2015/day-1-input.txt'

pos, answer = 0, 0

with open(filepath) as f:
    for char in f.read():
        # print(char)
        pos += 1
        if char == '(':
            answer += 1
        else:
            answer -= 1
        # print(pos, answer)
        if answer == -1:
            break

print(pos)
# 1795
