% m is the message pol one dimensional array which can be given as the input to
% the convolution encodersum

%Shravya Kunamalla
clear
clc
Y=gfpower([1 0],[1 0 0 0 1 1 1 0 1],2);   %Galois Field Matrix
t=8;               % Error Correcting Capability
genpoly=GP(t,Y);  %calculate the generator polynomial
gx=fliplr(genpoly); 
c=zeros(2,255);
% convolutional code rate parameters
%G=[1 1 1;1 0 1];                            % N x LK Generator polynomial matrix
G=[1 1 1 1 0 0 1; 1 0 1 1 0  1 1] ;         % G for (171,133)octal
                                               % g1(z)=1+z+z2+z3+z6
                                            % g2(z)=1+z2+z3+z5+z6
K=1;
N=size(G,1);    
rs_interleaving=2;
rate_rs=238.*8.*rs_interleaving; %interveling of RS code
nu=7; % convolutional code constraint length
kcc=255.*8.*4;
ncc=2.*kcc+2.*nu;
rate_all=kcc./ncc;
% Add noise
eb=[3:1:5]./10;
Eb_no=10.^eb; % Eb_no in dBw
sigma_noise=2./rate_all./Eb_no;
number_of_errors=zeros(1,length(sigma_noise));
for count=1:length(Eb_no)
    count
    
    for avg=1:50
        msg=randint(2,239,255);  %generating a random 2*239 array
        for i=1:2
            mx=msg(i,1:239);  
            cx=rsencode(mx,gx,Y);    %rs encoding
            c(i,1:255)=cx;
        end
        [mn,hh]=find(c==-inf);
        c(mn,hh)=0;
        c1=reshape(c,1,2*255); 
        c2=de2bi(c1);               %conversion from decimal to binary
        c3=(reshape(c2.',1,510*8));%input of cc encoder
        
            lnmsg=length(c3); 
            ch_input=conv_encoder(G,K,c3);      % convolutional encoder function
            [aa,bb]=size(ch_input);
            noise=sigma_noise(count).*randn(aa,bb);   %noise addition
            ch_output = ch_input+noise;
            %%%
            decoded_msg= vit_decoder(G,K,ch_output);   %convolution decoder
            comp=decoded_msg(1:lnmsg);

           rs=reshape(comp.',8,510);
           rs=rs.';
           rs1=(bi2de(rs))';               %conversion from binary to decimal
           rsdec_input(1,1:255)= rs1(1,1:2:509);  %deinterleaving
           rsdec_input(2,1:255)=rs1(1,2:2:510);
           error_locator=[];
        for i=1:2
            error_locator(i,:)=decoder(rsdec_input(i,1:255),genpoly,[1 0 0 0 1 1 1 0 1],8,Y);
        end  %rs decoding
        [a,b]=size(error_locator);
        errorr=ones(a,b);
        errorr(error_locator==Inf)=0;
        errorr(error_locator~=Inf)=1;
        [a,b]=size(errorr);
        error_per_msg=reshape(errorr,1,a.*b);
        number_of_errors(avg)=sum(error_per_msg);
    end
    number_of_errors1(count)=mean(number_of_errors);
end
Pe=number_of_errors1./(239*2);   %semilogy plot of BER
figure()
semilogy(eb.*10,Pe)
grid                                            

%error_locator gives the locations of the errors 



    