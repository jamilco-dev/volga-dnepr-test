import numpy as np
import pandas as pd


def reverse_bytes(data):
    return int.from_bytes(data.to_bytes(2, "little"), "big")


def readCYCNP():
    with open("Expl/76511121022p-1.dat", "rb") as file:
        # Извлекаем данные в массив с элементами по два байта
        data = np.fromfile(file, dtype=np.int16)

        # Вычисляем количество кадров
        indices_or_sections = len(data) // 256

        # Получаем 2-х мерный массив кадров по 256 слов, слово = 2байта
        data = np.array_split(data, indices_or_sections)

        # Получаем матрицу кадр-канал
        data = pd.DataFrame(data)

        # Выбираем 6-й канал
        print(data)
        data = data[5]

        # Фильтруем не нулевые
        data = data[data != 0]

        # Применяем маску выбора
        data = data.apply(lambda x: x & 4095)

        # Реверсируем биты
        data = data.apply(reverse_bytes)

        # Умножаем на коэфф
        data = data.apply(lambda x: x * 0.3048)

        # Фильтруем по значению > 10
        data = data[data > 10]

        print(f"Количество кадров: {len(data)}")


if __name__ == "__main__":
    readCYCNP()
