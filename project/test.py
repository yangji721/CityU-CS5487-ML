# -*- coding: utf-8 -*-
"""
Created on Thu Nov 28 20:45:57 2019

@author: cezhang
"""

import numpy as np
from sklearn import neighbors
from sklearn.decomposition import PCA
from sklearn.svm import SVC
from sklearn.linear_model import LogisticRegression
from sklearn.preprocessing import scale
from sklearn.linear_model import Perceptron

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
    X = readFile("./digits4000_txt/digits4000_digits_vec.txt")
    y = readFile("./digits4000_txt/digits4000_digits_labels.txt")
    y = np.ravel(y)
    
    train_x = X[:2000, :]
    train_y = y[:2000]
    test_x = X[2000:, :]
    test_y = y[2000:]
    
    ##KNN k=1
    n_neighbors = 1
    clf = neighbors.KNeighborsClassifier(n_neighbors)
    clf.fit(train_x, train_y)
    
    score = clf.score(test_x,test_y)
    print("KNN score: {:.6f}".format(score))
    
    # KNN add PCA:
    pca = PCA(45)
    pca.fit(train_x)
    train_x_r = pca.transform(train_x)
    test_x_r = pca.transform(test_x)
    clf = neighbors.KNeighborsClassifier(n_neighbors)
    clf.fit(train_x_r, train_y)
    
    score = clf.score(test_x_r,test_y)
    print("KNN with PCA 45 score: {:.6f}".format(score))
    
    ## SVM (default ovr)
    # use polynomial kernel
    
    clf = SVC(gamma='scale', kernel="poly")
    clf.fit(train_x,train_y)
    
    score = clf.score(test_x,test_y)
    print("SVM with poly kernel score: {:.6f}".format(score))
    
    ## SVM
    # use rbf kernel
    
    clf = SVC(gamma='scale', kernel="rbf")
    clf.fit(train_x,train_y)
    
    score = clf.score(test_x,test_y)
    print("SVM with rbf kernel score: {:.6f}".format(score))
    
    
    ## SVM
    # use scaled x
    train_x_scale = scale(train_x)
    test_x_scale = scale(test_x)
    clf = SVC(gamma='scale', kernel="rbf")
    clf.fit(train_x_scale,train_y)
    
    score = clf.score(test_x_scale,test_y)
    print("SVM with standard scale score: {:.6f}".format(score))
    
    ## SVM
    ## SVM add PCA
    clf = SVC(gamma='scale', kernel="rbf")
    pca = PCA(45)
    pca.fit(train_x)
    train_x_r = pca.transform(train_x)
    test_x_r = pca.transform(test_x)
    clf.fit(train_x_r, train_y)
    score = clf.score(test_x_r,test_y)
    print("SVM with PCA 45 score: {:.6f}".format(score))
    
    ## SVM
    #SVM OVO
    clf = SVC(gamma='scale', kernel="rbf", decision_function_shape ='ovo')
    clf.fit(train_x,train_y)
    
    score = clf.score(test_x,test_y)
    print("SVM with ovo kernel score: {:.6f}".format(score))
    
    ##Logistic Regression
    clf = LogisticRegression(random_state=0, solver='lbfgs', multi_class='multinomial', max_iter=10000).fit(train_x,train_y)
    score = clf.score(test_x,test_y)
    print("Logistic Regression score: {:.6f}".format(score))
    
    ##Logistic Regression plus PCA
    pca = PCA(45)
    pca.fit(train_x)
    train_x_r = pca.transform(train_x)
    test_x_r = pca.transform(test_x)
    clf = LogisticRegression(random_state=0, solver='sag', multi_class='multinomial', max_iter=10000).fit(train_x_r,train_y)
    score = clf.score(test_x_r,test_y)
    print("Logistic Regression with PCA 45 score: {:.6f}".format(score))
    
    ##Logistic Regression with standard scalar
#    train_x_scale = scale(train_x)
#    test_x_scale = scale(test_x)
#    clf = LogisticRegression(random_state=0, solver='sag', multi_class='multinomial', max_iter=10000).fit(train_x_scale,train_y)
#    score = clf.score(test_x_scale,test_y)
#    print("Logistic Regression with Standard Scalar: {:.6f}".format(score))
    
    
    #Perceptron
    clf = Perceptron(tol=1e-3, random_state=0)
    clf.fit(train_x,train_y)
    
    score = clf.score(test_x,test_y)
    print("Perceptron score: {:.6f}".format(score))
    
    #Perceptron with PCA
    clf = Perceptron(tol=1e-3, random_state=0)
    pca = PCA(45)
    pca.fit(train_x)
    train_x_r = pca.transform(train_x)
    test_x_r = pca.transform(test_x)
    clf.fit(train_x_r,train_y)
    
    score = clf.score(test_x_r,test_y)
    print("Perceptron with PCA score: {:.6f}".format(score))