% Main 
clear all;
close all;
clc;
% init
u0 = repelem(0,229);
u1 = repelem(1,211);
u2 = repelem(2,93);
u3 = repelem(3,35);
u4 = repelem(4,7);
u5 = repelem(5,1);
X = [u0, u1, u2, u3, u4, u5];

cluster = 4;
%pi = repelem(1/cluster,cluster);
pi = [0.1,0.2,0.3,0.4];
lambda = [2.4,0.1,1.5,0.7];

gamma = computeGamma(X,lambda,pi);
pi = computePi(X,gamma);
lambda = computelambda(X,gamma);
J1 = costFunction(X,lambda,pi,gamma);

gamma = computeGamma(X,lambda,pi);
pi = computePi(X,gamma);
lambda = computelambda(X,gamma);
J2 = costFunction(X,lambda,pi,gamma);

% iteration number 
iter = 2;
while abs(J2-J1) > 0.01
    gamma = computeGamma(X,lambda,pi);
    pi = computePi(X,gamma);
    lambda = computelambda(X,gamma);
    J1 = J2;
    J2 = costFunction(X,lambda,pi,gamma);
    iter = iter + 1;
end

g_pi = sprintf('%d',pi);
fprintf('Pi: %s\n', g_pi);
g_lambda = sprintf('%d',lambda);
fprintf('Lambda: %s\n', g_lambda);
g_iter = sprintf('%d',iter);
fprintf('iteration number is:%s\n', g_iter);
