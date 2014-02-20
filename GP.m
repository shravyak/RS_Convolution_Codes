function G=GP(t,Y)
%generation polnomial for rs encoding
   G=polymult([255 1],[255 2],Y);
      for j=3:2*t
      G=polymult(G,[255 j],Y);
      end
end