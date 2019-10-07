function [lambda] = computelambda(X,gamma)
% Get K dim
K = size(gamma,2);
% convert X into N*1 vector
input = X';
Data = repmat(input,1,K);
Data_sum = Data.*gamma;
% numerator 1*K vector
numerator = sum(Data_sum);
% Z(k) 1*k
denominator = sum(gamma);
% divide by elementwise
lambda = numerator./denominator;
end