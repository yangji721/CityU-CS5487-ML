function plotR(x ,y ,theta ,q, bit)
M = max(x(:));
N = min(x(:));
dx = (M - N)/100;

for j = 1 : 101
    xx(j) = N + dx*(j-1);
    yy(j) = 0;
    for k = 1:q+1
        yy(j) = yy(j) + theta(k)*xx(j)^(k-1);
    end
end

switch bit
    case 0
        figure(1)
        plot(x,y,'+',xx,yy)
        legend({'samples','function'},'Location','northeast')
        title('Least-Squares (LS)')
    case 1
        figure(2)
        plot(x,y,'+',xx,yy)
        legend({'samples','function'},'Location','northeast')
        title('Regularized LS (RLS)');
    case 2
        figure(3)
        plot(x,y,'+',xx,yy)
        legend({'samples','function'},'Location','northeast')
        title('L1-regularized LS (LASSO)');
    case 3
        figure(4)
        plot(x,y,'+',xx,yy)
        legend({'samples','function'},'Location','northeast')
        title('robust regression (RR)');
end
end