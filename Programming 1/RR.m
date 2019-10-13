function [theta] = robust(x ,y ,n ,q)
% x is the input set; 
% y is the output set;
% n is the set size
% q is the order of polynomial
% Here, A represents big phi; b is the outputs of samples
b = zeros(n,1);
for i = 1:n
   b(i) = y(i);
   for j = 1:q+1
       A(j,i) = x(i)^j;
   end
end

%Transform the program into a standard linear program
f = [zeros(q+1,1);ones(n,1)];
B = [-A',-eye(n);A',-eye(n)];
c = [-b;b];
target = linprog(f,B,c); 
theta = target(1:(q+1),:);
end


