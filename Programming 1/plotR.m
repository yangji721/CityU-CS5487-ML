function plotR(x ,y ,theta ,q, bit)
%M = max(x(:));
%N = min(x(:));
%dx = (M - N)/100;
load('poly_data.mat');
MSE = 0;
count = length(polyx);

for j = 1 : count
    xx(j) = polyx(j);
    yy(j) = 0;
    for k = 1:q+1
        yy(j) = yy(j) + theta(k)*xx(j)^(k-1);
    end
    MSE = MSE + (yy(j)-polyy(j))^2;
end

MSE = MSE/count;

switch bit
    case 0
        figure(1)
        plot(x,y,'+',xx,yy)
        legend({'samples','function'},'Location','northeast')
        title('Least-Squares (LS)');
        fprintf('The value of MSE in Least-Squares (LS) is: %f\n',MSE);
    case 1
        figure(2)
        plot(x,y,'+',xx,yy)
        legend({'samples','function'},'Location','northeast')
        title('Regularized LS (RLS)');
        fprintf('The value of MSE in Regularized LS (RLS) is: %f\n',MSE);
    case 2
        figure(3)
        plot(x,y,'+',xx,yy)
        legend({'samples','function'},'Location','northeast')
        title('L1-regularized LS (LASSO)');
        fprintf('The value of MSE in L1-regularized LS (LASSO) is: %f\n',MSE);
    case 3
        figure(4)
        plot(x,y,'+',xx,yy)
        legend({'samples','function'},'Location','northeast')
        title('robust regression (RR)');
        fprintf('The value of MSE in robust regression (RR) is: %f\n',MSE);
end
end