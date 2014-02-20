function error_locator= decoder(rx,genpoly,primpoly,t,Y)
s=syndrome(rx,t,Y);
lamda=bkm(s,primpoly,size(Y,2)); %error locator polynomial
error=errloc(lamda,t,Y);
error_locator=size(Y,1)-1-error; % matrix containing the positions of errors

end
