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

%%
% prior1 is alpha, we set alpha 1
% prior2 is sigma^2, we set it 5
clear;
load('poly_data.mat');

[miu, sigma] = BR(sampx ,sampy ,50 ,5, 1, 5);
plotBR(sampx ,sampy ,miu, sigma ,5);