%% Clear 
clear all;
close all;
clc;


% %% London
% u0 = repelem(0,229);
% u1 = repelem(1,211);
% u2 = repelem(2,93);
% u3 = repelem(3,35);
% u4 = repelem(4,7);
% u5 = repelem(5,1);
% X = [u0, u1, u2, u3, u4, u5];

%% Antwerp
u0 = repelem(0,325);
u1 = repelem(1,115);
u2 = repelem(2,67);
u3 = repelem(3,30);
u4 = repelem(4,18);
u5 = repelem(5,21);
X = [u0, u1, u2, u3, u4, u5];

%% Main
cluster = 4;
%pi = repelem(1/cluster,cluster);
%pi = [0.25,0.25,0.25,0.25];
%lambda = [1,1,1.5,2];
pi = [0.2,0.2,0.2,0.2, 0.2];
lambda = [1,2,3,4,5];

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

%g_pi = sprintf('%d',pi);
fprintf('Pi: %8.3f\n', pi);
%g_lambda = sprintf('%d',lambda);
fprintf('Lambda: %8.3f\n', lambda);
g_iter = sprintf('%d',iter);
fprintf('iteration number is:%s\n', g_iter);
