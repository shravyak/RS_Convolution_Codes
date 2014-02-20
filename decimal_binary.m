function y=decimal_binary(x,l)
% Converts a given decimal x(double) into a binary 
if x==0, y=0;
 else y=[];
      while x>=1,  y=[rem(x,2) y]; x=floor(x/2);  end
end
if nargin>1, y=[zeros(size(x,1),l-size(y,2)) y]; end