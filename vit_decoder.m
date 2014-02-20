function decoded_seq=vit_decoder(G,K,detected)
% performs the Viterbi algorithm on detected to get the decoded_seq
% G: N x LK Generator polynomial matrix
% K: Number of encoder input bits
%@Marwa Ali
detected = detected(:).';  
[N,LK]=size(G);
if rem(LK,K)~=0,
    error('Column dimension of matrix G must be a multiple of K');
end
tmp= rem(length(detected),N);
if tmp>0,  
    detected=[detected  zeros(1,N-tmp)]; 
end
b=LK-K; % Number of bits representing the state
no_of_states=2^b;   N_msgsymbol=length(detected)/N;
for m=1:no_of_states
   for n=1:N_msgsymbol+1
      states(m,n)=0; % inactive in the trellis
      p_state(m,n)=0; n_state(m,n)=0; input(m,n)=0;
   end   
end      
states(1,1)=1; % make the initial state active     
cost(1,1)=0; K2=2^K;
for n=1:N_msgsymbol
   y=detected((n-1)*N+1:n*N); % Received sequence
   n1=n+1;
   for m=1:no_of_states
      if states(m,n)==1 % active
        xb=decimal_binary(m-1,b);
        for m0=1:K2
           u=decimal_binary(m0-1,K);
           [nxb(m0,:),yb(m0,:)]=state_eq(xb,u,G);
           nxm0=binary_decimal(nxb(m0,:))+1;
           states(nxm0,n1)=1;
           dif=sum(abs(y-yb(m0,:)));
           d(m0)=cost(m,n)+dif;
           if p_state(nxm0,n1)==0 % Unchecked state node?
             cost(nxm0,n1)=d(m0);
             p_state(nxm0,n1)=m; input(nxm0,n1)=m0-1; 
            else
             [cost(nxm0,n1),i]=min([d(m0) cost(nxm0,n1)]);
             if i==1, p_state(nxm0,n1)=m; input(nxm0,n1)=m0-1; end
           end 
        end        
      end
   end
end 
decoded_seq=[];
for n=n1:-1:2
  decoded_seq= [decimal_binary(input(m,n),K) decoded_seq];
  m=p_state(m,n);
end