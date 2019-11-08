function [center,result] = em_gaussian(Data, K)
%% Main Function of Expectation Maximization for Gaussian Mixture Model
% For *output*
% P is the probality of each data in each cluster (N*D)
% para contains the parameter of mixture gaussian
% para.miu is a K*D matrix; 
% para.sigma is a D*D*K matrix; 
% para.pi is a 1*K matrix
% For *input* 
% Data is D*N matix, D is the dimension
% K is the number of clusters
%% Initialization
threshold = 1e-3;
[D,N] = size(Data);
% Randomly select K center point
rnd = randperm(N);
X = Data';
% center is K*D matrix
center = X(rnd(1:K),:);
% Initialize paramters
[Miu,Pi,Sigma] = init_para(X,center,K);
%% Iteration
Prev = -inf;
while 1
    % P is N*K matrix
    P = calcP(X,K,Miu,Sigma);
    % new value for Gamma  
    Gamma = P.*repmat(Pi, N, 1);
    % normalization
    Gamma = Gamma./repmat(sum(Gamma, 2), 1, K);   
    % new value for parameters of each Component  
    Ni = sum(Gamma, 1);
    Miu = diag(1./Ni)*Gamma'* X;  
    Pi = Ni/N; 
 
   for j = 1:K 
       Shift = X-repmat(Miu(j, :), N, 1); 
       Sigma(:, :, j) = (Shift'*(diag(Gamma(:,j))*Shift))/Ni(j);
   end
   
   L = sum(log(P*Pi')); 
   if (L-Prev) < threshold  
      break;  
   end  
   Prev = L;  
end

%% Output result
result = [];
[junk,index] = max(P,[],2);
for i = 1:N
    result = [result;X(i,:) index(i)];
end
center = Miu;
end