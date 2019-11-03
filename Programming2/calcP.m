function [P] = calcP(Data,K,Miu,Sigma)
%%
[N,D] = size(Data);
P = zeros(N,K);

for k = 1:K
    % x - uk, Shift is N*D matrix
    Shift = Data-repmat(Miu(k, :), N, 1);
    inv_Sigma = inv(Sigma(:, :, k)); 
    % tmp (N*1) is covariance matrix
    tmp = sum((Shift*inv_Sigma).*Shift, 2);     
    coef = (2*pi)^(-D/2)*sqrt(det(inv_Sigma));  
    P(:, k) = coef * exp(-0.5*tmp);  
end
end