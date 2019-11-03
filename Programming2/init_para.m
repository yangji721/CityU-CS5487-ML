function [Miu Pi Sigma] = init_para(Data,center,K)
%% Initialize the parameter for the model
[N,D] = size(Data);
Miu = center;
Pi = zeros(1,K);
Sigma = zeros(D,D,K);
% The distance of D dim (N*K)
distance = repmat(sum(Data.*Data,2),1,K) + repmat(sum(Miu.*Miu,2)',N,1) - 2*Data*Miu';
% labels is N*K
[junk,labels] = min(distance, [], 2);

%% Calculate each cluster data and covariance
for i = 1:K
Xi = Data(labels == i,:);
Pi(i) = size(Xi, 1)/N;
Sigma(:, :, i) = cov(Xi);
end
end
