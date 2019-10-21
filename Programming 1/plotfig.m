clear;
clc;

x = [1,2,3,4];
y1 = [28.312,10.793,12.857,0.332];
y2 = [82.205,3.475,0.284,0.941];
y3 = [27.046,1.138,0.95,0.563];
y4 = [10069.7,1.011,3.95,0.257];
y5 = [31.689,13.292,0.307,0.73];

figure(1)
plot(x,y1,'r',x,y2,'g',x,y3,'b',x,y4,'',x,y5)
set(gca,'xtick',[1,2,3,4])
set(gca,'xticklabel',{'10%';'25%';'50%';'75%'})
ylim([0.1 30]);
legend({'LS','RLS','LASSO','RR','BR'},'Location','northeast')
title('MSE versus Training Size');
saveas(figure(1),[pwd '/report/fig/1c-error.png']);