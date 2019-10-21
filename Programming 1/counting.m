%% Least Sqaure
clear;
load('count_data.mat');

theta = CLS(trainx,trainy);
plotC(trainx ,trainy ,theta, 0);

% %% RLS
% clear;
% load('count_data.mat');
% 
% theta = CRLS(trainx,trainy);
% plotC(trainx ,trainy ,theta, 1);
% 
% %% LASSO
% clear;
% load('count_data.mat');
% 
% theta = CLASSO(trainx,trainy);
% plotC(trainx ,trainy ,theta, 2);
% 
% %% Robust Regression
% clear;
% load('count_data.mat');
% 
% theta = CRR(trainx,trainy);
% plotC(trainx ,trainy ,theta, 3);
% 
% %% Bayesian Regression
% clear;
% load('count_data.mat');
% 
% [miu, sigma] = CBR(trainx ,trainy , 1, 5);
% plotCBR(trainx ,trainy ,miu, sigma );
% 
