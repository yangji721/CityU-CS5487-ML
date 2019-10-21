function [A] = featuret(x)

% B = x;
% C = x.^2;
% A = [B;C];
A = x;

for i = 1:9
    for j = i:9
        temp = x(i,:).*x(j,:);
        A = [A;temp];
    end
end

end