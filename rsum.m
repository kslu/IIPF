function cq = rsum(q,n)
% RSUM calculate the Ramanujan sum by von Sterneck's arithmetic function
% The result should be the same as rmjsum(q,n)
% 

cq = mmu(q./gcd(q,n)).*totient(q)./totient(q./(gcd(q,n)));
%cq = moebiusmu(q/gcd(q,n))*totient(q)/totient(q/(gcd(q,n)));