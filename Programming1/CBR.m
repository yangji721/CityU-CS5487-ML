function [miu, sigma] = BR(x ,y, prior1, prior2)
% x is the input set; 
% y is the output set;
% n is the set size
% q is the order of polynomial
q = 17;
b = y;

% A = x;
A = featuret(x);

sigma = inv((1/prior1)*eye(q+1) + (1/prior2)*(A*A'));
miu = (1/prior2)*sigma*A*b; 
end