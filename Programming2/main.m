%% Clear Variables & Load Data 
clear all;
close all;
clc;
load('PA2-cluster-data\cluster_data.mat');

% %% PA-2-1-k-means
% [center result]= kmean(dataA_X, 4);
% [rate]= plotf(result, dataA_Y, center);
% fprintf("The correction of k-means is %d\n", rate);

% %% PA-2-2-EM-GMM
% [result] = em_gaussian(dataA_X, 4);
% [rate]= plotf(result, dataA_Y, 0);
% fprintf("The correction of EM-GMM is %d\n", rate);

%% PA-2-3-Mean-Shift
[result] = meanshift(dataA_X);