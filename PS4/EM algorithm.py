# -*- coding: utf-8 -*-
"""
Created on Wed Oct  2 16:12:37 2019

@author: cezhang
"""

import numpy as np
from math import factorial
from math import exp
from scipy.stats import poisson

#X = [0] * 229
#X.extend([1] * 211)
#X.extend([2]*93)
#X.extend([3]*35)
#X.extend([4]*7)
#X.extend([5]*1)

X = [0] * 325
X.extend([1] * 115)
X.extend([2]*67)
X.extend([3]*30)
X.extend([4]*18)
X.extend([5]*21)

num_cluster = 3 # number of cluster
num_data = len(X) # number of data points
pi = [1/num_cluster] * num_cluster #init pi with 1/num_cluster
lamb = [0.4,0.7,0.8] #init lambda matrix
gamma = np.zeros((num_data, num_cluster))

def computeGamma(X,lamb,pi):
    n_data, n_cluster = len(X), len(pi)
    gamm = np.zeros((n_data,n_cluster))
    for i in range(n_cluster):
        gamm[:,i] = pi[i] * poisson.pmf(X,lamb[i])
    g = gamm / gamm.sum(axis=1).reshape(-1,1)
    return g

def computePi(gamm):
    pi = gamm.sum(axis=0)/gamm.sum()
    return pi
    
def computeLamb(X,gamm):
    n_cluster = gamm.shape[1]
    lamb = np.zeros((n_cluster,1))
    for i in range(n_cluster):
        lamb[i] = np.average(X,axis=0,weights=gamm[:,i])
    return lamb


for i in range(100):
    gamma = computeGamma(X,lamb,pi)
    pi = computePi(gamma)
    lamb = computeLamb(X,gamma)

print(lamb)
print(pi)