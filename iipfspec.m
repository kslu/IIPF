function x_sp=iipfspec(varargin)
% IIPFSPEC create IIPF spectrum 
%    spec=iipfspec(x,L)
%    spec: IIPF spectrum
%    L: length of the spectrum needed
%    x: input signal
if length(varargin)<1
    error('Input error');
elseif length(varargin)<2
    x=varargin{1};
    L=length(x);
else
    x=varargin{1};
    L=varargin{2};
    if L>length(x)
        error('Input length invalid');
    end
end

x_sp=zeros(1,L);
Lx=length(x);
for q=1:L
    d=ceil(Lx/q);
    N=q*d;
    Xk=fft(x,N);
    Ck=fft(rsum(q,1:N));
    x_sp(q)=sqrt(sum(abs(Xk.*Ck).^2)/N^4);
    %(construct rho_q principle character vector);
    %l=find(rho_q==1);
    %x_sp(q)=sum(abs(Xk(1+l*d)).^2)/N^2;
end