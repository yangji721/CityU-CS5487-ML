function plotBR(x ,y ,miu, sigma ,q)

%M = max(x(:));
%N = min(x(:));
%dx = (M - N)/100;
load('poly_data.mat');
MSE = 0;
count = length(polyx);

for j = 1 : count
    %xx(j) = N + dx*(j-1);
    xx(j) = polyx(j);
    mius(j) = 0;
    sigmas(j) = 0;
    for k = 1:q+1
        mius(j) = mius(j) + miu(k)*xx(j)^(k-1);
    end
    sigmas(j) = mulv(xx(j), q)'*sigma*mulv(xx(j),q);
    %yy(j) = normrnd(mius(j),sigmas(j));
    yy(j) = mius(j);
    yymax(j) = mius(j) + 2*sigmas(j);
    yymin(j) = mius(j) - 2*sigmas(j);
    MSE = MSE + (yy(j)-polyy(j))^2;
end

   MSE = MSE/count;
   fprintf('The value of MSE in Bayesian Regression is: %f\n',MSE);
   
   figure(5)
   plot(x,y,'+',xx,yy,'r',xx,yymax,'g',xx,yymin,'b')
   legend({'samples','function','Max-function','Min-function'},'Location','northeast')
   title('Bayesian regression (BR)');

end