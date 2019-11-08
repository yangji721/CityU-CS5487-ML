function [centroid,result]= meanshift(Data)
%% Initialization
% D is dimension
% N is the total number of data
[D,N] = size(Data);
% Using label to denote undiscovered data
label = 1:N;
bandwidth = 6;
data = Data';
threshold = 1e-7;
visit = zeros(N,1);
count=[];
clustern=0;
clustercenter=[];

%% Loop of Meanshift
% if there exists undiscovered data point...
while length(label) > 0
   
%% Randomly select a center point
rnd = ceil(length(label)*rand);
center = data(label(rnd),:);
% Calculate the frequency of each point 
frequency =zeros(N,1);
    
%% Move to new center until it converges
    while 1
    % calculate the distance between data and center data
    distance = sum((repmat(center,N,1)-data).^2,2);
    % flag denotes the inner point in the circle
    flag = find(distance < bandwidth*bandwidth);
    % record the visiting hitory
    visit(flag)=1;
    frequency(flag)=frequency(flag)+1;
    
    % Compute new center point 
    newcenter=zeros(1,D);
    sumweight=0;
    for i=1:length(flag)
        w = exp(distance(flag(i))/(bandwidth*bandwidth));
        sumweight = w + sumweight;
        newcenter = newcenter + w*data(flag(i),:);
    end
    newcenter=newcenter./sumweight;

    if norm(newcenter - center) < threshold
       break;
    end
        center = newcenter;
    end
    % Decide the need of merging
    mergewith=0;
    for i = 1:clustern
        betw = norm(center-clustercenter(i,:));
        if betw < bandwidth/2
            mergewith = i; 
            break;
        end
    end
    % No need to merge
    if mergewith==0           
        clustern=clustern + 1;
        clustercenter(clustern,:)=center;
        count(:,clustern)=frequency;
    else                      
    % merging
        clustercenter(mergewith,:)=0.5*(clustercenter(mergewith,:)+center);
        count(:,mergewith)=count(:,mergewith)+frequency;  
    end
    % Re-Calculate undiscovered data
    label = find(visit==0);
end

%% Calculate the Results
for i=1:N
    [value index] = max(count(i,:));
    Idx(i)=index;
end
result = [data, Idx'];
centroid = clustercenter;

end