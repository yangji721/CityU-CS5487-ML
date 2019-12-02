# -*- coding: utf-8 -*-
"""
Created on Thu Nov 28 20:45:57 2019

@author: cezhang
"""

import numpy as np
from sklearn import neighbors
from sklearn.decomposition import PCA
from sklearn.decomposition import KernelPCA
from sklearn.svm import SVC
from sklearn.linear_model import LogisticRegression
from sklearn.preprocessing import scale
from sklearn.linear_model import Perceptron
import matplotlib.pyplot as plt
import time

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

if __name__ == "__main__":
    X = readFile("./digits4000_txt/digits4000_txt/digits4000_digits_vec.txt")
    y = readFile("./digits4000_txt/digits4000_txt/digits4000_digits_labels.txt")
    y = np.ravel(y)
    
    train_x = X[:2000, :]
    train_y = y[:2000]
    test_x = X[2000:, :]
    test_y = y[2000:]
    
    #statistics
    count_list = [0]*10
    for i in train_y:
        count_list[int(i-1)] += 1
    
    print(count_list)
    print("the data set class is very balanced")
    
    ##KNN k=1
    n_neighbors = 1
    clf = neighbors.KNeighborsClassifier(n_neighbors)
    clf.fit(train_x, train_y)
    
    score = clf.score(test_x,test_y)
    print("KNN score: {:.6f}".format(score))
    
    
    dim_list = [10, 20, 30, 40, 50, 60, 70, 80, 90, 100]
    score_list = []
    for dim in dim_list:
        pca = PCA(dim)
        pca.fit(train_x)
        train_x_r = pca.transform(train_x)
        test_x_r = pca.transform(test_x)
        clf = neighbors.KNeighborsClassifier(n_neighbors)
        clf.fit(train_x_r, train_y)
        score = clf.score(test_x_r,test_y)
        score_list.append(score)
        print("KNN with "+str(dim)+"-dim PCA score: "+str(score))
    
    plt.plot(dim_list, score_list, color='red')
    plt.title("KNN Score with PCA")
    plt.xlabel("Dimension")
    plt.ylabel("Score")
    plt.show()
    
    
    score_list = []
    for dim in dim_list:
        pca = KernelPCA(n_components=dim,kernel="sigmoid")
        train_x_scale = scale(train_x)
        test_x_scale = scale(test_x)
        pca.fit(train_x_scale)
        train_x_r = pca.transform(train_x_scale)
        test_x_r = pca.transform(test_x_scale)
        clf = neighbors.KNeighborsClassifier(n_neighbors)
        clf.fit(train_x_r, train_y)
        score = clf.score(test_x_r,test_y)
        score_list.append(score)
        print("KNN with "+str(dim)+"-dim sigmoid kernel PCA score: "+str(score))
    
    plt.plot(dim_list, score_list, color='red')
    plt.title("KNN Score with sigmoid kernel PCA")
    plt.xlabel("Dimension")
    plt.ylabel("Score")
    plt.show()
    
    score_list = []
    for dim in dim_list:
        pca = KernelPCA(n_components=dim,kernel="rbf")
        train_x_scale = scale(train_x)
        test_x_scale = scale(test_x)
        pca.fit(train_x_scale)
        train_x_r = pca.transform(train_x_scale)
        test_x_r = pca.transform(test_x_scale)
        clf = neighbors.KNeighborsClassifier(n_neighbors)
        clf.fit(train_x_r, train_y)
        score = clf.score(test_x_r,test_y)
        score_list.append(score)
        print("KNN with "+str(dim)+"-dim rbf kernel PCA score: "+str(score))
    
    plt.plot(dim_list, score_list, color='red')
    plt.title("KNN Score with rbf kernel PCA")
    plt.xlabel("Dimension")
    plt.ylabel("Score")
    plt.show()
    
    ## SVM (default ovr)
    # use polynomial kernel
    
    
    clf = SVC(gamma='scale', kernel="poly")
    clf.fit(train_x,train_y)
    
    
    score = clf.score(test_x,test_y)
    print("SVM with poly kernel score: {:.6f}".format(score))
    
    
    
    ## SVM
    # use rbf kernel
    start_time = time.time()
    clf = SVC(gamma='scale', kernel="rbf")
    clf.fit(train_x,train_y)
    end_time = time.time()
    
    score = clf.score(test_x,test_y)
    print("SVM with rbf kernel score: {:.6f}".format(score))
    print("SVM with ovr running time: "+str(end_time-start_time))
    
    ## SVM
    #SVM OVO
    start_time = time.time()
    clf = SVC(gamma='scale', kernel="rbf", decision_function_shape ='ovo')
    clf.fit(train_x,train_y)
    end_time = time.time()
    
    score = clf.score(test_x,test_y)
    print("SVM with ovo kernel score: {:.6f}".format(score))
    print("SVM with ovo running time: "+str(end_time-start_time))
    
    ## SVM
    # use scaled x
    train_x_scale = scale(train_x)
    test_x_scale = scale(test_x)
    clf = SVC(gamma='scale', kernel="rbf")
    clf.fit(train_x_scale,train_y)
    
    score = clf.score(test_x_scale,test_y)
    print("SVM with rbf kernel and standard scale score: {:.6f}".format(score))
    
    ## SVM
    ## SVM add PCA
    score_list = []
    for dim in dim_list:
        pca = PCA(dim)
        pca.fit(train_x)
        train_x_r = pca.transform(train_x)
        test_x_r = pca.transform(test_x)
        clf = SVC(gamma='scale', kernel="rbf")
        clf.fit(train_x_r, train_y)
        score = clf.score(test_x_r,test_y)
        score_list.append(score)
        print("SVM with "+str(dim)+"-dim PCA score: "+str(score))
    
    plt.plot(dim_list, score_list, color='red')
    plt.title("SVM Score with PCA")
    plt.xlabel("Dimension")
    plt.ylabel("Score")
    plt.show()
    
    
    ## SVM + sigmoid kernel PCA
    score_list = []
    for dim in dim_list:
        pca = KernelPCA(n_components=dim,kernel="sigmoid")
        train_x_scale = scale(train_x)
        test_x_scale = scale(test_x)
        pca.fit(train_x_scale)
        train_x_r = pca.transform(train_x_scale)
        test_x_r = pca.transform(test_x_scale)
        clf = SVC(gamma='scale', kernel="rbf")
        clf.fit(train_x_r, train_y)
        score = clf.score(test_x_r,test_y)
        score_list.append(score)
        print("SVM with "+str(dim)+"-dim sigmoid kernel PCA score: "+str(score))
    
    plt.plot(dim_list, score_list, color='red')
    plt.title("SVM Score with sigmoid kernel PCA")
    plt.xlabel("Dimension")
    plt.ylabel("Score")
    plt.show()
    
    
    score_list = []
    for dim in dim_list:
        pca = KernelPCA(n_components=dim,kernel="rbf")
        train_x_scale = scale(train_x)
        test_x_scale = scale(test_x)
        pca.fit(train_x_scale)
        train_x_r = pca.transform(train_x_scale)
        test_x_r = pca.transform(test_x_scale)
        clf = SVC(gamma='scale', kernel="rbf")
        clf.fit(train_x_r, train_y)
        score = clf.score(test_x_r,test_y)
        score_list.append(score)
        print("SVM with "+str(dim)+"-dim rbf kernel PCA score: "+str(score))
    
    plt.plot(dim_list, score_list, color='red')
    plt.title("SVM Score with rbf kernel PCA")
    plt.xlabel("Dimension")
    plt.ylabel("Score")
    plt.show()
    
    ##Logistic Regression
    clf = LogisticRegression(random_state=0, solver='lbfgs', multi_class='multinomial', max_iter=10000).fit(train_x,train_y)
    score = clf.score(test_x,test_y)
    print("Logistic Regression score: {:.6f}".format(score))
    
    score_list = []
    for dim in dim_list:
        pca = PCA(dim)
        pca.fit(train_x)
        train_x_r = pca.transform(train_x)
        test_x_r = pca.transform(test_x)
        clf = LogisticRegression(random_state=0, solver='lbfgs', multi_class='multinomial', max_iter=10000).fit(train_x_r,train_y)
        score = clf.score(test_x_r,test_y)
        score_list.append(score)
        print("Logistic Regression with "+str(dim)+"-dim PCA score: "+str(score))
    
    plt.plot(dim_list, score_list, color='red')
    plt.title("Logistic Regression Score with PCA")
    plt.xlabel("Dimension")
    plt.ylabel("Score")
    plt.show()


    score_list = []
    for dim in dim_list:
        pca = KernelPCA(n_components=dim,kernel="sigmoid")
        train_x_scale = scale(train_x)
        test_x_scale = scale(test_x)
        pca.fit(train_x_scale)
        train_x_r = pca.transform(train_x_scale)
        test_x_r = pca.transform(test_x_scale)
        clf = LogisticRegression(random_state=0, solver='lbfgs', multi_class='multinomial', max_iter=10000)
        clf.fit(train_x_r, train_y)
        score = clf.score(test_x_r,test_y)
        score_list.append(score)
        print("Logistic Regression with "+str(dim)+"-dim sigmoid kernel PCA score: "+str(score))
    
    plt.plot(dim_list, score_list, color='red')
    plt.title("Logistic Regression Score with sigmoid kernel PCA")
    plt.xlabel("Dimension")
    plt.ylabel("Score")
    plt.show()

    score_list = []
    for dim in dim_list:
        pca = KernelPCA(n_components=dim,kernel="rbf")
        train_x_scale = scale(train_x)
        test_x_scale = scale(test_x)
        pca.fit(train_x_scale)
        train_x_r = pca.transform(train_x_scale)
        test_x_r = pca.transform(test_x_scale)
        clf = LogisticRegression(random_state=0, solver='lbfgs', multi_class='multinomial', max_iter=10000)
        clf.fit(train_x_r, train_y)
        score = clf.score(test_x_r,test_y)
        score_list.append(score)
        print("Logistic Regression with "+str(dim)+"-dim rbf kernel PCA score: "+str(score))
    
    plt.plot(dim_list, score_list, color='red')
    plt.title("Logistic Regression Score with rbf kernel PCA")
    plt.xlabel("Dimension")
    plt.ylabel("Score")
    plt.show()
    
    ##Logistic Regression with standard scalar
#    train_x_scale = scale(train_x)
#    test_x_scale = scale(test_x)
#    clf = LogisticRegression(random_state=0, solver='sag', multi_class='multinomial', max_iter=10000).fit(train_x_scale,train_y)
#    score = clf.score(test_x_scale,test_y)
#    print("Logistic Regression with Standard Scalar: {:.6f}".format(score))
#    
#    
    #Perceptron
    clf = Perceptron(tol=1e-3, random_state=0)
    clf.fit(train_x,train_y)
    
    score = clf.score(test_x,test_y)
    print("Perceptron score: {:.6f}".format(score))
    
    dim_list = [10, 20, 30, 40, 50, 60, 70, 80, 90, 100, 110, 120, 130, 140, 150]
    score_list = []
    for dim in dim_list:
        pca = PCA(dim)
        pca.fit(train_x)
        train_x_r = pca.transform(train_x)
        test_x_r = pca.transform(test_x)
        clf = Perceptron(tol=1e-3, random_state=0).fit(train_x_r,train_y)
        score = clf.score(test_x_r,test_y)
        score_list.append(score)
        print("Perceptron with "+str(dim)+"-dim PCA score: "+str(score))
    
    plt.plot(dim_list, score_list, color='red')
    plt.title("Perceptron Score with PCA")
    plt.xlabel("Dimension")
    plt.ylabel("Score")
    plt.show()
    

    score_list = []
    for dim in dim_list:
        pca = KernelPCA(n_components=dim,kernel="sigmoid")
        train_x_scale = scale(train_x)
        test_x_scale = scale(test_x)
        pca.fit(train_x_scale)
        train_x_r = pca.transform(train_x_scale)
        test_x_r = pca.transform(test_x_scale)
        clf = Perceptron(tol=1e-3, random_state=0).fit(train_x_r,train_y)
        score = clf.score(test_x_r,test_y)
        score_list.append(score)
        print("Perceptron with "+str(dim)+"-dim sigmoid kernel PCA score: "+str(score))
    
    plt.plot(dim_list, score_list, color='red')
    plt.title("Perceptron Score with sigmoid kernel PCA")
    plt.xlabel("Dimension")
    plt.ylabel("Score")
    plt.show()
    
    score_list = []
    for dim in dim_list:
        pca = KernelPCA(n_components=dim,kernel="rbf")
        train_x_scale = scale(train_x)
        test_x_scale = scale(test_x)
        pca.fit(train_x_scale)
        train_x_r = pca.transform(train_x_scale)
        test_x_r = pca.transform(test_x_scale)
        clf = Perceptron(tol=1e-3, random_state=0).fit(train_x_r,train_y)
        score = clf.score(test_x_r,test_y)
        score_list.append(score)
        print("Perceptron with "+str(dim)+"-dim rbf kernel PCA score: "+str(score))
    
    plt.plot(dim_list, score_list, color='red')
    plt.title("Perceptron Score with rbf kernel PCA")
    plt.xlabel("Dimension")
    plt.ylabel("Score")
    plt.show()
#    #Perceptron with PCA
#    clf = Perceptron(tol=1e-3, random_state=0)
#    pca = PCA(45)
#    pca.fit(train_x)
#    train_x_r = pca.transform(train_x)
#    test_x_r = pca.transform(test_x)
#    clf.fit(train_x_r,train_y)
#    
#    score = clf.score(test_x_r,test_y)
#    print("Perceptron with PCA score: {:.6f}".format(score))