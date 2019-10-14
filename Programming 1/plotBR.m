function plotBR(x ,y ,miu, sigma ,q)

M = max(x(:));
N = min(x(:));
dx = (M - N)/100;


for j = 1 : 101
    xx(j) = N + dx*(j-1);
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
end

   figure(1)
   plot(x,y,'+',xx,yy,'g',xx,yymax,'b',xx,yymin)
   legend({'samples','function','Max-function','Min-function'},'Location','northeast')
   title('Bayesian regression (BR)');

end