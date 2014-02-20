function [qx,rx]=polydiv(ax,bx,Y)
N=length(Y(:,1))-1;
deg_b=length(bx)-1;
% qx=zeros(max(length(ax)-length(bx),0)+1);
rx=zeros(1,length(bx),1);
deg_r=length(ax)-1;
deg_a=length(ax)-1;
deg_b=length(bx)-1;
deg_q=deg_a-deg_b;
qx=-Inf*ones(1,(deg_q)+1);
temp=-Inf*ones(1,deg_q+1);
while deg_r>=deg_b
    qx(deg_a-deg_b+1)=mod(ax(deg_a+1)-bx(end),N);
   temp(deg_a-deg_b+1)=mod(ax(deg_a+1)-bx(end),N);
    rx=gfadd(ax,gfconv(temp,bx,Y),Y);
    deg_r=max(find(rx~=-Inf))-1;
    ax=rx;
    deg_a=deg_r;
    clear rx
    temp=-Inf*ones(1,deg_q+1);
end

rx=ax;
end
