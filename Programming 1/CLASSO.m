function theta = CLASSO(x ,y)
% x is the input set; 
% y is the output set;
% n is the set size
% q is the order of polynomial

lamda = 3;
q = 17;
b = y;

% A = x;
A = featuret(x);


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