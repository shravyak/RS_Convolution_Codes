% convolutional encoder decoder main 
% @Marwa Ali
%--------------------------------------------------------------------------
function msg=conv_main(source_msg)
%source_msg=c1;
%source_msg=randint(1,10)
lnmsg=length(source_msg);                   % Message length
G=[1 0 1;1 1 1];                            % N x LK Generator polynomial matrix
%G=[1 1 1 1 0 0 1; 1 0 1 1 0  1 1] ;         % G for (171,133)octal
                                            % g1(z)=1+z+z2+z3+z6
                                            % g2(z)=1+z2+z3+z5+z6
K=1;
N=size(G,1);                                
Pe=0.03;                                     % Probability of transmitted bit error
ch_input=conv_encoder(G,K,source_msg);      % convolutional encoder function
notbe=ceil(Pe*length(ch_input));
error_bits=randerr(1,length(ch_input),notbe); 
detected_msg= rem(ch_input+error_bits,2);   % message with errors
decoded_msg= vit_decoder(G,K,detected_msg)
comp(1,1:lnmsg)=decoded_msg(1:lnmsg);
number_of_errors=sum(source_msg~=comp)
   % Number of errors
  msg=comp;
   
end                                            
                                            
                                            

% % First Matlab built in convolutional encoder to compaer with 
% codeRate = 1/2;                             % Code Rate
% constlen = 7;                               % Constraint Length
% codegen = [171 133];                        % Generator Polynomials
% trellis = poly2trellis(constlen, codegen);  % Create Trellis structure
% 
% % Encode transmitted sequence
% xEnc = convenc(x, trellis);
% 
% 
% 
% %Adding AWGN
% % SNR per coded bit
% EbNo = 10;
% 
% % SNR per uncoded bit
% EsNo = EbNo+10*log10(k)-10*log10(1/codeRate);
% 
% % Add the noise
% yNoisy = awgn(yTx,EsNo,'measured');
% 
