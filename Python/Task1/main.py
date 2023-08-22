import numpy as np
import pandas as pd


def reverse_bits(n, no_of_bits=16):
    result = 0
    for i in range(no_of_bits):
        result <<= 1
        result |= n & 1
        n >>= 1
    return result


def readCYCNP():
    with open("Expl/76511121022p-1.dat", "rb") as file:
        data = np.fromfile(file, dtype=np.int16)
        # print(data)
        # data = np.array([reverse_bits(val) for val in data])
        # print(data)

        indices_or_sections = len(data) // 256
        data = np.array_split(data, indices_or_sections)
        data = pd.DataFrame(data)
        print(data)


def a():
    arr = np.arange(11)

    arr = np.array([reverse_bits(val) for val in arr])

    print(arr)


if __name__ == "__main__":
    readCYCNP()
    # a()
