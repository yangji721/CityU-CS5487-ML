%% least-squares (LS)
clear;
load('poly_data.mat');

sample = [sampx;sampy'];
% randomly sample data
datasize = length(sampx);
samplesize = round(0.75*datasize);

sample_ = sample(:,randperm(datasize, samplesize));

sampx = sample_(1,:);
sampy = (sample_(2,:))';

theta = LS(sampx ,sampy ,samplesize, 5);
plotR(sampx ,sampy ,theta ,5, 0);

%% regularized LS (RLS)
clear;
load('poly_data.mat');

sample = [sampx;sampy'];
% randomly sample data
datasize = length(sampx);
samplesize = round(0.75*datasize);

sample_ = sample(:,randperm(datasize, samplesize));

sampx = sample_(1,:);
sampy = (sample_(2,:))';

theta = RLS(sampx ,sampy ,samplesize ,5);
plotR(sampx ,sampy ,theta ,5, 1);

%% L1-regularized LS (LASSO)
clear;
load('poly_data.mat');

sample = [sampx;sampy'];
% randomly sample data
datasize = length(sampx);
samplesize = round(0.75*datasize);

sample_ = sample(:,randperm(datasize, samplesize));

sampx = sample_(1,:);
sampy = (sample_(2,:))';

theta = LASSO(sampx ,sampy ,samplesize ,5);
plotR(sampx ,sampy ,theta ,5, 2);

%% robust regression (RR)
clear;
load('poly_data.mat');

sample = [sampx;sampy'];
% randomly sample data
datasize = length(sampx);
samplesize = round(0.75*datasize);

sample_ = sample(:,randperm(datasize, samplesize));

sampx = sample_(1,:);
sampy = (sample_(2,:))';

theta = RR(sampx ,sampy ,samplesize ,5);
plotR(sampx ,sampy ,theta ,5, 3);

%%
% prior1 is alpha, we set alpha 1
% prior2 is sigma^2, we set it 5
clear;
load('poly_data.mat');

sample = [sampx;sampy'];
% randomly sample data
datasize = length(sampx);
samplesize = round(0.75*datasize);

sample_ = sample(:,randperm(datasize, samplesize));

sampx = sample_(1,:);
sampy = (sample_(2,:))';

[miu, sigma] = BR(sampx ,sampy ,samplesize ,5, 1, 5);
plotBR(sampx ,sampy ,miu, sigma ,5);