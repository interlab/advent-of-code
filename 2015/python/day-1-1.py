
filepath = '../../input/2015/day-1-input.txt'

with open(filepath) as f:
    data = f.read()
    # data = ')))'
    # data = ')())())'

plus = data.count('(')
minus = data.count(')')
answer = plus - minus
print(answer)
# 74
