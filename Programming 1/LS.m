function [theta] = LS(x ,y ,n ,q)
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
theta = inv(A*(A'))*A*b;
end
