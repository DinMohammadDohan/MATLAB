clc;
I = imread( );
%show image
imshow(I);
%encoding image into array of bits
B = dec2bin(I);
%converted into bits
C = reshape(B', 1,numel(B)
%decoding image from bits
D = reshape(C,size(B,2),size(B,1));
I_out = reshape(bin2dec(D'),size(I_in))
%show image
imshow(I_out);