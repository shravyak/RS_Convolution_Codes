% syndrome calculation
function s=syndrome(rx,t,Y)
n=length(rx);
sum(1:2*t)=[-Inf];
for j=1:2*t
for i=1:n
    pro=mult(rx(i),j*(n-i),Y);
    if pro==-Inf
        sum(j)=sum(j);
    else
    sum(j)=add(sum(j),pro,Y);
    end

end
end
s=sum;
end