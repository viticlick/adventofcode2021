from typing import List

def read_lines(input_file):
    with open(input_file, 'r') as lines:
        deeps = []
        for line in lines:
            line = line.strip()
            deeps.append(line)
    return deeps

def solution1(data: List[int]) -> int:
    # Look at pairs and check that second value is bigger
    return sum(a < b for a, b in zip(data, data[1:]))


def solution2(data: List[int]) -> int:
    # simply a moving window of 3 measurements
    window = list(zip(data, data[1:], data[2:]))  # can't use subscription otherwise
    return sum(sum(a) < sum(b) for a, b in zip(window, window[1:]))

print('the solution is')
print(solution1(read_lines('real_input')))