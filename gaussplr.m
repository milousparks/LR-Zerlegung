% GAUSSPLR berechnet die LR-Zerlegung mit Spaltenpivotisierung
%   [L, R, piv] = GAUSSPLR(A)
%   Eingabe:
%       A       (n x n) Matrix, regulär
%   Ausgabe:
%       L,R     (n x n) Matrizen L, R mit L*R = P*A
%       piv     (n x 1) Vektor der Zeilenvertauschungen
%
function [L, R, piv] = gaussplr(A)
    
    n = size(A,1);
    piv = (1:n)';
    for i=1:n-1
        [~,ipiv] = max(abs(A(i:end,i)));
        ipiv =  ipiv + i - 1;
        A([i,ipiv],:) = A([ipiv,i],:);
        piv([i,ipiv]) = piv([ipiv,i]);
        A(i+1:end,i) = A(i+1:end,i)./A(i,i);
        A(i+1:end,i+1:end) = A(i+1:end,i+1:end) - A(i+1:end,i)*A(i,i+1:end);
    end
    
    L = eye(n) + tril(A,-1); 
    R = triu(A); 
end
