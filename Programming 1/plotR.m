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
        saveas(figure(1),[pwd '/report/fig/1c-75%-ls.png']);
    case 1
        figure(2)
        plot(x,y,'+',xx,yy)
        legend({'samples','function'},'Location','northeast')
        title('Regularized LS (RLS)');
        fprintf('The value of MSE in Regularized LS (RLS) is: %f\n',MSE);
        saveas(figure(2),[pwd '/report/fig/1c-75%-rls.png']);
    case 2
        figure(3)
        plot(x,y,'+',xx,yy)
        legend({'samples','function'},'Location','northeast')
        title('L1-regularized LS (LASSO)');
        fprintf('The value of MSE in L1-regularized LS (LASSO) is: %f\n',MSE);
        saveas(figure(3),[pwd '/report/fig/1c-75%-lasso.png']);
    case 3
        figure(4)
        plot(x,y,'+',xx,yy)
        legend({'samples','function'},'Location','northeast')
        title('Robust Regression (RR)');
        fprintf('The value of MSE in robust regression (RR) is: %f\n',MSE);
        saveas(figure(4),[pwd '/report/fig/1c-75%-rr.png']);
end
end