% Main test file
clear
clc
source_msg=[1 0 1 1 0 0 0 1]  % msg=randint(1,100)
lnmsg=length(source_msg); % Message and its length
G=[1 0 1;1 1 1]; % N x LK Generator polynomial matrix
K=1; N=size(G,1); % Size of encoder input/output
potbe=.02; % Probability of transmitted bit error
% Use of conv_encoder()/vit_decoder()
ch_input=conv_encoder(G,K,source_msg); % Self-made convolutional encoder
notbe=ceil(potbe*length(ch_input));
error_bits=randerr(1,length(ch_input),notbe); 
detected= rem(ch_input+error_bits,2); % Received/modulated/detected
decoded= vit_decoder(G,K,detected)
noe_vit_decoder=sum(source_msg~=decoded(1:lnmsg))  % Number of errors