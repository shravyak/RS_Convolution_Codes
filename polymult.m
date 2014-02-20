function  P=polymult(a1,a2,Y)
% (X+a1)(X+a2)
m=length(a1);
m1=length(a2);
n=length(a1)+length(a2)-1;
P1(1:n)=[-Inf];
P(1:n)=[-Inf];
 for j=1:length(a1)
   for l=1:length(a2)
  P1(j+l-1)= mult(a1(j),a2(l),Y);
   end; 
    for k=1:n
    P(k)=add(P(k),P1(k),Y);
 end
       P1(1:n)=[-Inf];           
 end
             
        