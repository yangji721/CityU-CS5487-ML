function theta = CRLS(x ,y)
% x is the input set; 
% y is the output set;
% n is the set size
% q is the order of polynomial

lambda = 0.57;

% A = x;

A = featuret(x);


theta = inv((A*(A'))+ lambda.*eye(18))*A*y;

end