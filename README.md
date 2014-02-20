RS_Convolution_Codes
====================
The main file to run the whole system is main encoder.m. . It is worth
mentioning that both decoders and encoders are generic for different code
rates and parameters and not just the set of paramerters mentioned in this
report. A full description of the functions for the RS Encoder and Decoder
is as follows:

• Function gfpower generates the Galois field matrix. It takes the prim-
itive element a, primitive polynomial qx and the prime number p.
Size of the Galois Field matrix is (pm,m), where m is an integer.
In the implemented system, p = 2, a = [10], qx = [100011101] and
[Y ] = gfpower(a, qx, p).

• A = add(a1, a2, Y ): a1 and a2 are the powers of  which we want to
add in the field Y .
• [M] = mult(a, b, Y ): a, b are the powers of  which we want to mul-
tiply in the field Y .
• P = polymult(a1, a2, Y ): performs the multiplication (X + a1)(X +
a2). Here, polymult is used for the calculation of generator polynomial.
• G = GP(t, Y ): generator polynomial for Rs encoding. GP takes the
error correcting capability t and Y as the input and gives the gener-
ator polynomial as the output; in increasing powers of indeterminate
variable x).
• rsencode(mx, gx, Y ): once the Generator polynomial is found, system-
atic rs encoding. It takes the message mx, generator polynomial gx
and field Y as the input and gives the code polynomial as the output.
• [qx, rx] = polydiv(ax, bx, Y ): takes xn−k mx as ax and bx as gx and
gives the quotient and remainder when ax is divided by bx.
• RS decoding is done using the Berleykamp Masey algorithm.
• s = syndrome(rx, t, Y ): it takes the received vector (output of con-
volution decoder), number of errors t and the field as the inputs and
gives the syndrome as the output. The syndrome is given as the input
to the function BKM which gives the error locater polynomial as the
output.
7
• roots = errloc(lamda, t, Y ): it takes lamda as the input and gives the
exact locations of the errors.
A full description of the functions for the convolutional Encoder and Decoder
is as follows:
• conv encoder(G,K, c3): encodes the binary message through convolu-
tional encoder. The function takes an arbitrary generating matrix G
and K input bits entering the encoder at each clock cycle. The output
is in binary form. It checks on the dimensions of the generator matrix
G and make sure that the number of column of G is a multiple of K.
• vit decoder(G,K, detected): performs the Viterbi algorithm on de-
tected to get the decoded sequence in binary form. The parameters G
is the generator polynomial matrix and K is the number of encoder
input bits.
