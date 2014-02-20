function roots=errloc(lamda,t,Y)
[m,n]=size(Y);
sum=0;
deg_lamda=length(lamda)-1;
k=1;
loc=-Inf*ones(1,t);
for i=1:m-1
    for j=2:deg_lamda+1
    val=mult(lamda(j),(i-1)*(j-1),Y);
    sum=add(sum,val,Y);
    end 
    if sum==-Inf
       loc(k)=i-1; 
    k=k+1;
    end
    sum=0;
end
roots=loc;
end
