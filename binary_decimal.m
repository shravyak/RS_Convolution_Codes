function z=binary_decimal(x)
%This function converts binary values into decimal values 
[A,B]=size(x);
z=zeros(A,1);
for i=1:A,
    l=length(x(i,:));
    y=(l-1:-1:0);
    y=2.^y;
    y=x(i,:)*y';
    z(i,:)=y;
end
z=z';  