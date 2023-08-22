import numpy as np


def rpkm(counts, lengths):
    """Вычислить прочтения на тысячу оснований экзона на миллион
    картированных прочтений (reads per kilobase transcript per million reads).
    RPKM = (10^9 * C) / (N * L)
    где:
    C = количество прочтений, картированных на ген
    N = суммы количеств картированных (выровненных) прочтений в эксперименте
    L = длина экзона в парах оснований для гена
    Параметры
    ---------
    counts: массив, форма (N_genes, N_samples)
    РНК-сек (или подобные) количественные данные, где столбцы являются
    отдельными образцами и строки – генами.
    lengths: массив, форма (N_genes,)
    Длины генов в парах оснований в том же порядке, что и
    строки в counts.
    Возвращает
    ----------
    normed: массив, форма (N_genes, N_samples)
    Матрица количеств counts, нормализованная согласно RPKM.
    """

    N = np.sum(counts, axis=0)  # просуммировать каждый столбец, чтобы
    # получить суммы количеств прочтений на образец
    L = lengths
    C = counts
    normed = 1e9 * C / (N[np.newaxis, :] * L[:, np.newaxis])
    return normed


if __name__ == "__main__":
    # array1d = np.array([1, 2, 3, 4])
    # print(array1d)
    # print(type(array1d))
    # print(array1d.shape)
    gene0 = [100, 200]
    gene1 = [50, 0]
    gene2 = [350, 100]
    expression_data = [gene0, gene1, gene2]

    array2d = np.array(expression_data)
    print(array2d)
    print(array2d.shape)
    print(type(array2d))
