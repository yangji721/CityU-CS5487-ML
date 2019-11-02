function [miu, sigma] = BR(x ,y ,n ,q, prior1, prior2)
% x is the input set; 
% y is the output set;
% n is the set size
% q is the order of polynomial
b = zeros(n,1);

for i = 1:n
   b(i) = y(i);
   for j = 1:q+1
       A(j,i) = x(i)^(j-1);
   end
end

sigma = inv((1/prior1)*eye(q+1) + (1/prior2)*(A*A'));
miu = (1/prior2)*sigma*A*b; 
end