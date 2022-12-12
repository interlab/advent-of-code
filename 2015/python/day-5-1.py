
day = 5

filepath = f'../../input/2015/day-{day}-input.txt'

ngood = 0

# Хорошая строка:
#     содержит по крайней мере три гласные (только aeiou).
#     содержит по крайней мере одну букву, которая появляется дважды подряд, например xx, abcdde (dd) 
#         или aabbccdd (aa, bb, cc или dd).
#     не содержит строк ab, cd, pq или xy, даже если они являются частью одного из других требований.

# data = 'ugknbfddgicrmopn'
# data = 'aaa'
# data = 'jchzalrnumimnmhp'
# data = 'haegwjzuvuyypxyu'
# data = 'dvszwmarrgswjxmb'

with open(filepath) as f:
    for line in f:
        data = line.strip()
        rule1 = len([x for x in data if x in ('a','e','i','o','u')]) > 2
        rule2 = len([x for x in set(iter(data)) if x+x in data]) > 0
        rule3 = all((False for x in ('ab', 'cd', 'pq', 'xy') if x in data))
        # debug
        # print(rule1, rule2, rule3)
        if rule1 and rule2 and rule3:
            ngood += 1
        # debug
        # break


print(ngood)
# 255
