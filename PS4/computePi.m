function [pi] = computePi(X,gamma)
% Data Size
N = length(X);
% sum by column
temp = sum(gamma);
pi = temp./N;
end
