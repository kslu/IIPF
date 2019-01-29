function [G1,G2,I]=iipf_analysis(x)
% IIPF_ANALYSIS show iipf 2D structure
% [G1,G2]=iipf_analysis(x) 
%   x: input (should be iipf)
%   G1: 2D structure (no circular shift)
%   G2: 2D structure (circular shift)
if ~isipf(x)
    error('The input is not an IIPF');
end
N=length(x);
pfac=factor(N);
pp_list=unique(pfac);   % list of prime power factorization
for i=1:numel(pp_list)
    pp_list(i)=prod(pfac(pfac==pp_list(i)));
end
plist=sort(pp_list,'descend');
H=plist(1); 
W=N/plist(1);

temp=zeros(W,H);
temp(1:N)=x(1:N);
G1=temp.';

G2=0*G1;
I=reshape(1:N,W,H)';  % original index
shift_to=mod(1:W:N,H); % first column mod H

for i=1:W
    shift_amount=find(shift_to==mod(i,H))-1;
    G2(:,i)=circshift(G1(:,i),shift_amount);
    I(:,i)=circshift(I(:,i),shift_amount);
end