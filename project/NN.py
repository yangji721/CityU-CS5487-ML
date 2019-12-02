# -*- coding: utf-8 -*-
"""
Created on Sun Dec  1 21:17:08 2019

@author: cezhang
"""

import numpy as np
from keras.models import Sequential
from keras.layers import Dense, Activation, Dropout, Conv2D, MaxPooling2D, Flatten
from keras.optimizers import SGD
from sklearn.decomposition import PCA
from sklearn.decomposition import KernelPCA
import matplotlib.pyplot as plt

def readFile(name):
    f = open(name,"r")
    lst = []
    for line in f:
        l = line.split()
        numlst = [float(v) for v in l]
        lst.append(numlst)
    f.close()
    lst = np.array(lst)
    return lst



def run(train_x, train_y, test_x, test_y):
    model = Sequential()
    model.add(Dense(500,input_shape=(train_x.shape[1],), activation="relu"))  #28*28=784
    model.add(Dropout(0.5))
    model.add(Dense(500, activation="relu"), )
    model.add(Dropout(0.5))
    model.add(Dense(10))
    model.add(Activation("softmax"))
    sgd = SGD(lr=0.01, decay=1e-6, momentum=0.9, nesterov=True)   
    model.compile(loss='categorical_crossentropy', optimizer=sgd, metrics=['accuracy'])
    
    model.fit(train_x, train_y, batch_size=200, epochs=400, shuffle=True, verbose=0, validation_split=0.1)
    print("start test")
    scores = model.evaluate(test_x, test_y, batch_size=200, verbose=1)
    print("The test loss is: "+str(scores[0]))
    print('Test accuracy:', str(scores[1]))
       
def runwPCA(train_x, train_y, test_x, test_y):
    dim_list = [10, 20, 30, 40, 50, 60, 70, 80, 90, 100]
    score_list = []
    for dim in dim_list:
        pca = PCA(dim)
        pca.fit(train_x)
        train_x_r = pca.transform(train_x)
        test_x_r = pca.transform(test_x)
        model = Sequential()
        model.add(Dense(500,input_shape=(train_x_r.shape[1],), activation="relu"))  #28*28=784
        model.add(Dropout(0.5))
        model.add(Dense(500, activation="relu"), )
        model.add(Dropout(0.5))
        model.add(Dense(10))
        model.add(Activation("softmax"))
        sgd = SGD(lr=0.01, decay=1e-6, momentum=0.9, nesterov=True)   
        model.compile(loss='categorical_crossentropy', optimizer=sgd, metrics=['accuracy'])
        
        model.fit(train_x_r, train_y, batch_size=200, epochs=400, shuffle=True, verbose=0, validation_split=0.1)
        print("start test")
        scores = model.evaluate(test_x_r, test_y, batch_size=200, verbose=1)
        print("The test loss is: "+str(scores[0]))
        print('Test accuracy:', str(scores[1]))
        score_list.append(scores[1])
        print("NN with "+str(dim)+"-dim rbf kPCA score: "+str(scores[1]))
    
    plt.plot(dim_list, score_list, color='red')
    plt.title("NN Score with PCA")
    plt.xlabel("Dimension")
    plt.ylabel("Score")
    plt.show()
    
def runwKPCA(train_x, train_y, test_x, test_y):
    dim_list = [10, 20, 30, 40, 50, 60, 70, 80, 90, 100]
    score_list = []
    for dim in dim_list:
        pca = KernelPCA(n_components=dim,kernel="rbf")
        pca.fit(train_x)
        train_x_r = pca.transform(train_x)
        test_x_r = pca.transform(test_x)
        model = Sequential()
        model.add(Dense(500,input_shape=(train_x_r.shape[1],), activation="relu"))  #28*28=784
        model.add(Dropout(0.5))
        model.add(Dense(500, activation="relu"), )
        model.add(Dropout(0.5))
        model.add(Dense(10))
        model.add(Activation("softmax"))
        sgd = SGD(lr=0.01, decay=1e-6, momentum=0.9, nesterov=True)   
        model.compile(loss='categorical_crossentropy', optimizer=sgd, metrics=['accuracy'])
        
        model.fit(train_x_r, train_y, batch_size=200, epochs=400, shuffle=True, verbose=0, validation_split=0.1)
        print("start test")
        scores = model.evaluate(test_x_r, test_y, batch_size=200, verbose=1)
        print("The test loss is: "+str(scores[0]))
        print('Test accuracy:', str(scores[1]))
        score_list.append(scores[1])
        print("NN with "+str(dim)+"-dim rbf kPCA score: "+str(scores[1]))
    
    plt.plot(dim_list, score_list, color='red')
    plt.title("NN Score with rbf kernel PCA")
    plt.xlabel("Dimension")
    plt.ylabel("Score")
    plt.show()
    
def runwSkPCA(train_x, train_y, test_x, test_y):
    dim_list = [10, 20, 30, 40, 50, 60, 70, 80, 90, 100]
    score_list = []
    for dim in dim_list:
        pca = KernelPCA(n_components=dim,kernel="sigmoid")
        pca.fit(train_x)
        train_x_r = pca.transform(train_x)
        test_x_r = pca.transform(test_x)
        model = Sequential()
        model.add(Dense(500,input_shape=(train_x_r.shape[1],), activation="relu"))  #28*28=784
        model.add(Dropout(0.5))
        model.add(Dense(500, activation="relu"), )
        model.add(Dropout(0.5))
        model.add(Dense(10))
        model.add(Activation("softmax"))
        sgd = SGD(lr=0.01, decay=1e-6, momentum=0.9, nesterov=True)   
        model.compile(loss='categorical_crossentropy', optimizer=sgd, metrics=['accuracy'])
        
        model.fit(train_x_r, train_y, batch_size=200, epochs=400, shuffle=True, verbose=0, validation_split=0.1)
        print("start test")
        scores = model.evaluate(test_x_r, test_y, batch_size=200, verbose=1)
        print("The test loss is: "+str(scores[0]))
        print('Test accuracy:', str(scores[1]))
        score_list.append(scores[1])
        print("NN with "+str(dim)+"-dim sigmoid kPCA score: "+str(scores[1]))
    
    plt.plot(dim_list, score_list, color='red')
    plt.title("NN Score with sigmoid kernel PCA")
    plt.xlabel("Dimension")
    plt.ylabel("Score")
    plt.show()
    
if __name__ == "__main__":
    X = readFile("./digits4000_txt/digits4000_txt/digits4000_digits_vec.txt")
    y = readFile("./digits4000_txt/digits4000_txt/digits4000_digits_labels.txt")
    y = np.ravel(y)
    
    train_x = X[:2000, :]
    train_x /= 256
    train_y = y[:2000]
    train_y_oh = np.zeros((2000,10))
    for i in range(2000):
        train_y_oh[i][int(train_y[i])] = 1
        
    
    test_x = X[2000:, :]
    test_x /= 256
    test_y = y[2000:]
    test_y_oh = np.zeros((2000,10))
    for i in range(2000):
        test_y_oh[i][int(test_y[i])] = 1
    
    
    runwSkPCA(train_x, train_y_oh, test_x, test_y_oh)
    