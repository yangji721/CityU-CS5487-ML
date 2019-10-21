function theta = CLS(x ,y)
% x is the input set; 
% y is the output set;
% n is the set size
% q is the order of polynomial

%A = x;
A = featuret(x);

theta = inv(A*(A'))*A*y;

end