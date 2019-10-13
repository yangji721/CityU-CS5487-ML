%% Linear Regression
clear;
load('poly_data.mat');

%theta = LS(sampx ,sampy ,50 ,5);
%theta = RLS(sampx ,sampy ,50 ,5);
theta = LASSO(sampx ,sampy ,50 ,5);
plotR(sampx ,sampy ,theta ,5);
