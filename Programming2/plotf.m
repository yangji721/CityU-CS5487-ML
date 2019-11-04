function [rate]= plotf(result, gtruth, center)

%% Pretreatment
if isscalar(center)
    if center == 0
       L = 0;
    else
       L = 2;
    end
else
    L =1;
end
%% Pretreatment
% m is the number of data, (p-1) is the dim of data
[m p] = size(result);

data = result(:,1:(p-1));
label = result(:,p);

%% Calculate the correct rate
rate = length(find(label-gtruth'))/m;

%% Plot Figure
figure;
hold on;
for i=1:m 
    if result(i,p)==1 
         scatter(result(i,1),result(i,2),'ro'); 
         if L == 1
            scatter(center(1,1),center(1,2),'r*','LineWidth',5);
         end
    elseif result(i,p)==2
         scatter(result(i,1),result(i,2),'go'); 
         if L == 1 
            scatter(center(2,1),center(2,2),'g*','LineWidth',5);
         end
    elseif result(i,p)==3
         scatter(result(i,1),result(i,2),'ko');
         if L == 1
             scatter(center(3,1),center(3,2),'k*','LineWidth',5);
         end
    else 
         scatter(result(i,1),result(i,2),'bo'); 
         if L == 1
             scatter(center(4,1),center(4,2),'b*','LineWidth',5);
         end
    end
end
grid on;
end