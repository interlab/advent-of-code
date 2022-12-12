
# thanks: https://github.com/mattcorbin/advent2015/blob/main/day5/src/main.rs
# как обычно, я не мог понять условие задачи

day = 5

filepath = f'../../input/2015/day-{day}-input.txt'

ngood = 0

def find_1(data) -> bool:
    for i in range(0, len(data)-1):
        # debug
        # print(data[i:i+2], data.count(data[i:i+2]))
        if data.count(data[i:i+2]) > 1:
            return True


def find_2(data) -> bool:
    for i in range(0, len(data)-1):
        it = data[i:i+3]
        # debug
        # print(it)
        try:
            if it[0] == it[2]:
                return True
        except IndexError:
            continue
    return False

with open(filepath) as f:
    for line in f:
        data = line.strip()
        if find_1(data) and find_2(data):
            ngood += 1


print(ngood)
# 55
