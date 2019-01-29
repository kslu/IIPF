function F = rsmtx(M)
% RSMTX Ramanujan-Sum matrix
% F = rsmtx(M)
% F: output matrix     M: order of RS
if M>4096
    F = zeros(M);
    for i=1:M
        F(i,:) = rsum(i,1:M);
    end
    return;
end

if M<=1024
    load RSmat1024
    F = R1024(1:M,1:M);
elseif M<=2048
    load RSmat2048
    F = RSmat2048(1:M,1:M);
else
    load RSmat4096
    F = RSmat4096(1:M,1:M);
end