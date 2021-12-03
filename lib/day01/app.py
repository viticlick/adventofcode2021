def read_lines(input_file):
    depths = open(input_file).read().split("\n")
    return [int(a) for a in depths]

def sum_depth_measures(deeps):
    index = 1
    counter = 0
    print('profundidad: ',  len(deeps))
    while index < len(deeps):
        if deeps[index] > deeps[index - 1]:
            #print(deeps[index], 'is deeper than ', deeps[index -1])
            counter += 1
        #else:
            #print(deeps[index], 'is lower than ', deeps[index -1])
        index += 1
    return counter

def get_changes(report):
    return [int(x) - int(y) for x, y in zip(report, report[1:])]

deeps = read_lines('real_input')
counter = sum_depth_measures(deeps)
print(f'depth measurement increases {counter} times')
changes =  get_changes(deeps)
print(changes)
counter2 = 0
for x in changes:
    if x < 0:
        counter2 += 1
print(counter2)



