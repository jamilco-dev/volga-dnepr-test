import pandas as pd

import pickle


def read():
    file = open("Expl/ILVD23.CYC", "rb")
    data = pickle.load(file)
    file.close()
    print(data)


if __name__ == "__main__":
    read()
