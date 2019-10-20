function [theta] = LASSO(x ,y ,n ,q)
% x is the input set; 
% y is the output set;
% n is the set size
% q is the order of polynomial
% Here, A represents big phi; b is the outputs of samples
b = zeros(n,1);
for i = 1:n
   b(i) = y(i);
   for j = 1:q+1
       A(j,i) = x(i)^(j-1);
   end
end
% Since LASSO doesn;t have closed-form answer, we use equivalent quadratic programming
% to get a approximate solution
lamda = 0;
% Set quadprog parameter
H = [A*(A'), -A*(A'); -A*(A'), A*(A')];
f = lamda*ones(2*q+2,1) - [A*b;-A*b];
B = -eye(2*q+2);
c = zeros(2*q+2,1);
target = quadprog(H,f,B,c);
thetaM = target(1:q+1,:);
thetaN = target(q+2:end,:);
theta = thetaM - thetaN;
end
