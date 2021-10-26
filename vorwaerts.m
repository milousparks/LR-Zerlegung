function [z] = vorwaerts(L,piv,b)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
Pb=b(piv,:);
n = size(A,1);
z=(n);
for i=1:n-1 
    for j=n-1
        z(j)=Pb(i)-L(i,j)*z(j-1);
    end

    
end

end

