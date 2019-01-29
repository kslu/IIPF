function c=rsmap1col(x,n)
% RSMAP1COL find a single column of the RS map
%    c=rsmap1col(x,n)
%    c: output data
%    x: input signal 
%    n: index of the column
N=length(x);
q=ceil(N/n);
b=repmat(rsum(n,1:n),1,q)/N;
xx=[x zeros(1,n*q-N)];
temp=ifft(fft(b).*fft(xx));
temp=temp([end 1:end-1]);
c=temp(1:N);