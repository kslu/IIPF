function v=iipfdecomp(s)
% IIPFDECOMP IIPF decomposition by circular convolution
%     v = iipfdecomp(s)
%     s: input signal (in a period)
%     v: iipf components
T=length(s);
sfac = find(~mod(T,1:T));  % find factors of T
Q=numel(sfac);
v=zeros(Q,T);
for i=1:Q
    v(i,:)=rsmap1col(s,sfac(i));
end