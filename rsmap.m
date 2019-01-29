function Y=rsmap(varargin)
% RSMAP Ramanujan-sum Transform map
%     Y = rsmap(x,pshift,N,showPlot)
%     x: input signal
%     pshift: number of shifts processed
%     N: length of NRS transform (default: 840)
%     showPlot: option for showing plots (default: 0)
%     Y: output matrix

%% parse input
if length(varargin)<1
    error('function input should contain x and T');
else
    x = varargin{1};
    x=x(:).';
end
if length(varargin)<4 || isempty(varargin{4})
    showPlot = 0;
else
    showPlot = varargin{4};
end
if length(varargin)<3 || isempty(varargin{3})
    N = 840;
else
    N = varargin{3};
end
if length(varargin)<2 || isempty(varargin{2})
    pshift = min(length(x),20);
else
    pshift = varargin{2};
end

if N>length(x)
    N = length(x)-pshift;
    % fprintf('N is set to %d\n',N);
end

%% frequency transform
% N1 = length(x);
% R=rsmtx(N);
% Y=zeros(N,pshift);
% for i=1:N
%     c=floor(N1/i);
%     b=R(i,[N mod(0:i*c-2,N)+1])/(i*c);
%     temp=ifft(fft(x(1:i*c)).*fft(b));
%     Y(i,:)=temp(1:pshift).';
% end
Y=zeros(N,pshift);
for i=1:N
    temp=rsmap1col(x(1:N),i);
    Y(i,:)=temp(1:pshift);
end

%% plot
if showPlot
    showrsmap(Y);
end