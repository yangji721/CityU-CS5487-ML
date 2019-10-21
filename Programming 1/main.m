% %% least-squares (LS)
% clear;
% load('poly_data.mat');
% 
% % sample = [sampx;sampy'];
% % % randomly sample data
% % datasize = length(sampx);
% % samplesize = round(0.75*datasize);
% % 
% % sample_ = sample(:,randperm(datasize, samplesize));
% % 
% % sampx = sample_(1,:);
% % sampy = (sample_(2,:))';
% 
% % theta = LS(sampx ,sampy ,samplesize, 5);
% 
% % sampx = [sampx,-1,-0.5,0,0.5,1];
% % sampy = [sampy;20;15;10;-10;-15];
% 
% theta = LS(sampx ,sampy ,50, 10);
% plotR(sampx ,sampy ,theta ,10, 0);
% 
% %% regularized LS (RLS)
% clear;
% load('poly_data.mat');
% 
% % sample = [sampx;sampy'];
% % % randomly sample data
% % datasize = length(sampx);
% % samplesize = round(0.75*datasize);
% % 
% % sample_ = sample(:,randperm(datasize, samplesize));
% % 
% % sampx = sample_(1,:);
% % sampy = (sample_(2,:))';
% 
% % sampx = [sampx,-1,-0.5,0,0.5,1];
% % sampy = [sampy;20;15;10;-10;-15];
% 
% theta = RLS(sampx ,sampy ,50 ,10);
% plotR(sampx ,sampy ,theta ,10, 1);
% 
% %% L1-regularized LS (LASSO)
% clear;
% load('poly_data.mat');
% 
% % sample = [sampx;sampy'];
% % % randomly sample data
% % datasize = length(sampx);
% % samplesize = round(0.75*datasize);
% % 
% % sample_ = sample(:,randperm(datasize, samplesize));
% % 
% % sampx = sample_(1,:);
% % sampy = (sample_(2,:))';
% 
% % sampx = [sampx,-1,-0.5,0,0.5,1];
% % sampy = [sampy;20;15;10;-10;-15];
% 
% theta = LASSO(sampx ,sampy ,50 ,10);
% plotR(sampx ,sampy ,theta ,10, 2);
% 
% %% robust regression (RR)
% clear;
% load('poly_data.mat');
% 
% % sample = [sampx;sampy'];
% % % randomly sample data
% % datasize = length(sampx);
% % samplesize = round(0.75*datasize);
% % 
% % sample_ = sample(:,randperm(datasize, samplesize));
% % 
% % sampx = sample_(1,:);
% % sampy = (sample_(2,:))';
% 
% % sampx = [sampx,-1,-0.5,0,0.5,1];
% % sampy = [sampy;20;15;10;-10;-15];
% 
% theta = RR(sampx ,sampy ,50 ,10);
% plotR(sampx ,sampy ,theta ,10, 3);
% 
% %%
% % prior1 is alpha, we set alpha 1
% % prior2 is sigma^2, we set it 5
% clear;
% load('poly_data.mat');
% 
% % sample = [sampx;sampy'];
% % % randomly sample data
% % datasize = length(sampx);
% % samplesize = round(0.75*datasize);
% % 
% % sample_ = sample(:,randperm(datasize, samplesize));
% % 
% % sampx = sample_(1,:);
% % sampy = (sample_(2,:))';
% 
% % sampx = [sampx,-1,-0.5,0,0.5,1];
% % sampy = [sampy;20;15;10;-10;-15];
% 
% [miu, sigma] = BR(sampx ,sampy ,50,10, 1, 5);
% plotBR(sampx ,sampy ,miu, sigma ,10);