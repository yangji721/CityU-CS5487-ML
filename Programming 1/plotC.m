function plotC(x ,y ,theta , bit)
%M = max(x(:));
%N = min(x(:));
%dx = (M - N)/100;
base = linspace(1,600,600);

load('count_data.mat');
MSE = 0;
MAE = 0;
count = length(testy);

input = featuret(testx);

for j = 1 : count
    yy(j) = (input(:,j))'*theta;
    MSE = MSE + (yy(j)-testy(j))^2;
    MAE = MAE + abs(yy(j)-testy(j));
end

MSE = MSE/count;
MAE = MAE/count;

switch bit
    case 0
        figure(1)
        plot(base,testy,'+',base,yy,'+')
        legend({'true counts','predictions'},'Location','northeast')
        title('Least-Squares (LS)');
        fprintf('The value of MSE in Least-Squares (LS) is: %f\n',MSE);
        fprintf('The value of MAE in Least-Squares (LS) is: %f\n',MAE);
        saveas(figure(1),[pwd '/report/fig/2b-ls.png']);
    case 1
        figure(2)
        plot(base,testy,'+',base,yy,'+')
        legend({'true counts','predictions'},'Location','northeast')
        title('Regularized LS (RLS)');
        fprintf('The value of MSE in Regularized LS (RLS) is: %f\n',MSE);
        fprintf('The value of MAE in Regularized LS (RLS) is: %f\n',MAE);
        saveas(figure(2),[pwd '/report/fig/2b-rls.png']);
    case 2
        figure(3)
        plot(base,testy,'+',base,yy,'+')
        legend({'true counts','predictions'},'Location','northeast')
        title('L1-regularized LS (LASSO)');
        fprintf('The value of MSE in L1-regularized LS (LASSO) is: %f\n',MSE);
        fprintf('The value of MAE in L1-regularized LS (LASSO) is: %f\n',MAE);
        saveas(figure(3),[pwd '/report/fig/2b-lasso.png']);
    case 3
        figure(4)
        plot(base,testy,'+',base,yy,'+')
        legend({'true counts','predictions'},'Location','northeast')
        title('Robust Regression (RR)');
        fprintf('The value of MSE in robust regression (RR) is: %f\n',MSE);
        fprintf('The value of MAE in robust regression (RR) is: %f\n',MAE);
        saveas(figure(4),[pwd '/report/fig/2b-rr.png']);
end
end