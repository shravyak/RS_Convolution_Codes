function [M]=mult(a,b,Y)
% Multiply two elements over Galois field.
[m,n]=size(Y);
if a==-Inf || b==-Inf;
    M=-Inf;
    return 
end
if a~=-Inf && b~=-Inf 
sum=1;
I=ismember(Y,Y(mod(a,m-1)+2,1:n),'rows');
J=ismember(Y,Y(mod(b,m-1)+2,1:n),'rows');
for i=1:size(Y,1)
      if I(i,1)==0;
            sum=sum+1;
      else I(i,1)=1;
         break
      end
end
F=sum-2;
summ=1;
for j=1:size(Y,1)
      if J(j,1)==0
            summ=summ+1;
      else J(j,1)==1;
          break
    end
end
G=summ-2;
Z=G+F;
if Z>=size(Y,1)-1
    L=mod(Z,m-1);
M=[L];
else
M=[Z];
end
end
end

