function [Y]=gfpower(a,qx,p)
% Setup
m = length(qx);
b = zeros(1,m-1);
b(end) = 1;
Y=zeros(256,8);
% Recursively compute the sequence
for i=1:(p^(m-1)-1)
Y(i+1,:)=b;
b = mod(conv(b,a),p);
b = reduce(b,qx,p);
Y(i+1,:)=fliplr(Y(i+1,:));
end
end


