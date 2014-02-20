function A=add(a1,a2,Y);
% Add two elements over Galois field
%@Shravya
if a1==-Inf && a2==-Inf || a1==a2
A=-Inf;
return 
end
[m n]=size(Y);
if a1==-Inf && a2~=-Inf
        X=Y(mod(a2,m-1)+2,1:n);
    else if a2==-Inf && a1~=-Inf
        X=Y(mod(a1,m-1)+2,1:n);
        else if a2~=-Inf && a1~=-Inf
X=xor((Y(mod(a1,m-1)+2,1:n)),(Y(mod(a2,m-1)+2,1:n)));
end
    end
    end
match=ismember(Y,X,'rows');
S=0;
sum=1;
for i=1:m
      if match(i,1)==0;
            sum=sum+1;
      else match(i,1)==1;
          S=sum; 
        end
end
A=S-2;




