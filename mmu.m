function U = mmu(N)
%MMU Moebius function for vectors

if any(N(:)<1) || any(floor(N(:))~=N(:))
  error('MATLAB:moebiusmu:InputNotPosIntGrZero', 'N must be a positive integer greater than 0.'); 
end

U = N;
for i=1:numel(N)
    if N(i)~=1
        p = factor(N(i));
        M = hist([0 p],max(p)+1);
        r = sum(M(2:end) > 1);
        if r>0
            U(i) = 0;
        else
            k = sum(M(2:end) > 0);
            U(i) = (-1)^k;
        end
    end
end
