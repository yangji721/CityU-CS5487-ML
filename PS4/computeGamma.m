function [gamma] = computeGamma(X,lambda,pi)
% Data Size
N = length(X);
% Number of clusters
K = length(lambda);
gamma = zeros(N,K);
for i = 1:K
    gamma(:,i) = pi(1,i).*poisspdf(X',lambda(1,i));
end
denominator = sum(gamma,2);
for m = 1:K 
    for n = 1:N
        gamma(n,m) = gamma(n,m)./denominator(n,1);
    end
end
end

