function c = rmjsum(q,n)
% RMJSUM calculate the Ramanujan sum directly
c=0;
for t=1:q
    if gcd(t,q)==1
        c = c + real(exp(2*i*pi*t/q*n));
    end
end