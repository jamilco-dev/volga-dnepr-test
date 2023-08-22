import numpy as np
import pandas as pd


def readCYCNP():
    with open("Expl/76511121022p-1.dat", "rb") as file:
        data = np.fromfile(file, dtype=np.int16)

        indices_or_sections = len(data) // 256
        print(indices_or_sections)
        data = np.array_split(data, indices_or_sections)
        data = pd.DataFrame(data)
        print(len(data))
        print(data)


if __name__ == "__main__":
    readCYCNP()
