function [cost] = costFunction(X,lambda,pi,gamma)
% Compute cost function
% logq(k,l) N*K
K = length(pi);
N = length(X);
cat = zeros(N,K);
for i = 1:N
    for j = 1:K
        cat(i,j) = pi(1,j).*poisspdf(X(1,i),lambda(1,j));
    end
end
J = gamma.*log(cat);
cost = sum(J(:));
end

