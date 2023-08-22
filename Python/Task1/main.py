import pickle


def readdCYC():
    file=open("Expl/ILVD23.CYC","rb")
    data=bytearray(file.read(2))
    i = 1
    while len(data) > 0:
        print (f"{i}: {data}")
        data=bytearray(file.read(2))
        i +=1
    file.close()

def write():
    file = open("binary.dat",'wb')
    x = [1,2,3,4,5]    #data we wrote in file
    pickle.dump(x,file)
    file.close()

def read():
    file = open("binary.dat",'rb')
    data = pickle.load(file)
    file.close()
    print(data)


if __name__ == "__main__":
    # write()
    # read()
    readdCYC()
