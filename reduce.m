function b = reduce(a, qx, p)
m = length(qx);
while(length(a)>=m)
a(1:m) = mod(a(1:m)-a(1)*qx,p);
a = a(2:end);
end
b = a;