function cx= rsencode(mx,gx,Y) %msg in ascending powers of x
%does the systematic encoding of the message mx in a field Y of generator
%polynomial gx
%@Shravya Kunamalla
[m,n]=size(Y);
k=length(mx);
ax=[-Inf*ones(1,m-k-1) mx];
[qx,rx]=polydiv(ax,gx,Y);
rx=rx(1:max(find(rx~=-Inf)));
len=length(rx);
if len<16
    rx=[rx zeros(1,16-len)];
end
cx=[rx mx];
end