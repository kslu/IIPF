function showrsmap(varargin)
% SHOWRSMAP show RS map
%     showrsmap(Y,H,W)
%     Y: the RS map 
%     H: height to show
%     W: width to show
if length(varargin)<1
    error('Input error');
elseif length(varargin)<2
    Y=varargin{1};
    H=min(40,size(Y,1)); W=min(40,size(Y,2));
elseif length(varargin)<3
    Y=varargin{1};
    H=varargin{2};
    W=min(40,size(Y,2));
else
    Y=varargin{1};
    H=varargin{2};
    W=varargin{3};
end
if H>size(Y,1) || W>size(Y,2)
    error('Input width or height is invalid~');
end

imagesc(Y(1:H,1:W).');
colormap(gray(256));
colorbar;
set(gca,'Ydir','normal');
%title('RS map');
xlabel('q'); ylabel('r (shift)');