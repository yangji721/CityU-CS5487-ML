function plotR(x ,y ,theta ,q)
M = max(x(:));
N = min(x(:));
dx = (M - N)/100;

for j = 1 : 101
    xx(j) = N + dx*(j-1);
    yy(j) = 0;
    for k = 1:q+1
        yy(j) = yy(j) + theta(k)*xx(j)^k;
    end
end
plot(x,y,'+',xx,yy);
title('Linear Regression');
end