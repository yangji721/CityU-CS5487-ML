function [center result]= kmean(data, K)
%% Function Parameter Notes
% data represents number and dimension
% K is the pre-defined number of clusters
% center is the the center of each cluster
% result it the data_X and clustering label

%% Pretreatment
% m denotes the number of rows(dim); n denotes the number of column (data,size)
[m n] = size(data);
% the max number in each column
n_max = zeros(m);
% the min number in each column
n_min = zeros(m);
% Define the center point in each cluster
center = zeros(K,m);
% initialization of center point
for i= 1:m
    n_max(i) = max(data(i,:));
    n_min(i) = min(data(i,:));
    for j = 1:K
        center(j,i) = n_min(i) +(n_max(i)-n_min(i))*rand();
    end
end

%% Endless Iteration until it converges
while 1
    % Define distance
    pre_c = center;
    distance = zeros(K,n,m);
    for i = 1:K
        for j = 1:n
            for k = 1:m
            distance(i,j,k) = data(k,j) - center(i,k);
            end
        end
    end
    
    % Calculate z_ij
    z = zeros(n,K);
    for i = 1:n
        tmp = [];
        for j = 1:K
            tmp = [tmp,vecnorm(distance(j,i,:))];
        end
        [value_min index] = min(tmp);
        z(i,index) = 1;
    end
    
    % Update center point
    for i=1:K          
        for j=1:m
            center(i,j)=sum(z(:,i).*(data(j,:)'))/sum(z(:,i));
        end           
    end
    
    % if center point almostly doesn't move, then it means converging
    if (norm(pre_c-center) < 0.1)
        break;
    end
end

%% Calculate Results
    result=[];
    for i=1:n
        tmp=[];
        for j=1:K
            tmp=[tmp norm(data(:,i)'-center(j,:))];
        end
        [value_min, index]=min(tmp);
        result=[result;data(:,i)' index];
    end

end



