function [vec] = mulv(x, q)
vec = zeros(q+1,1);
for n = 1:q+1
    vec(n) = x^(n-1); 
end
end