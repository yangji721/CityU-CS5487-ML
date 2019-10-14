%% least-squares (LS)
clear;
load('poly_data.mat');

theta = LS(sampx ,sampy ,50, 5);
plotR(sampx ,sampy ,theta ,5, 0);

%% regularized LS (RLS)
clear;
load('poly_data.mat');

theta = RLS(sampx ,sampy ,50 ,5);
plotR(sampx ,sampy ,theta ,5, 1);

%% L1-regularized LS (LASSO)
clear;
load('poly_data.mat');

theta = LASSO(sampx ,sampy ,50 ,5);
plotR(sampx ,sampy ,theta ,5, 2);

%% robust regression (RR)
clear;
load('poly_data.mat');

theta = RR(sampx ,sampy ,50 ,5);
plotR(sampx ,sampy ,theta ,5, 3);
