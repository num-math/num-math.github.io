clear   % smazani neznamych
clc     % vymazani Command window

%% Testovaci matice
pocet_matic = 3;

A_vse{1} = randn(30,30);    name{1} = 'nahodna matice';
A_vse{2} = hilb(8);         name{2} = 'Hilbertova matice';
A_vse{3} = gallery ('chebvand', 10);
                        name{3} = 'Chebyshevova-Vandermondova matice';

%% Vypocet rozkladu

pocet_rozkladu = 4;

for i = 1:pocet_matic
    A = A_vse{i};
    
    n = size(A,2);
    kappa_A(i)  = cond(A);             % cislo podminenosti matice
    norm_A(i)  = norm(A);              % spektralni norma matice
    
    [Q,R] = cgs(A); 
        ztrata_OG(1,i) = norm(Q'*Q-eye(n));  % ztrata ortogonality
        residuum(1,i) = norm(A-Q*R);         % residuum QR rozkladu
    [Q,R] = mgs(A); 
        ztrata_OG(2,i) = norm(Q'*Q-eye(n));  
        residuum(2,i) = norm(A-Q*R);                 
%     [Q,R] = hh(A);
%         ztrata_OG(3,i) = norm(Q'*Q-eye(n)); 
%         residuum(3,i) = norm(A-Q*R);        
    [Q,R] = givens(A); 
        ztrata_OG(4,i) = norm(Q'*Q-eye(n));  
        residuum(4,i) = norm(A-Q*R);         

end


%% Vypsani vysledku

% reziduum rozkladu
for i = 1:pocet_matic
    jmeno = name{i};
    normA   = norm_A(i);
    
    fprintf(['***  ', jmeno ,' - reziduum \n']);
    fprintf('CGS:    |A-QR|_2   = %e \n', residuum(1,i));
    fprintf('MGS:    |A-QR|_2   = %e \n', residuum(2,i));
%     fprintf('HH:     |A-QR|_2   = %e \n', residuum(3,i));
    fprintf('Givens: |A-QR|_2   = %e \n', residuum(4,i));
    fprintf('ocekavani (eps*|A|) = %.1e \n\n', eps*normA);
      
end

% ztrata ortogonality - je treba doplnit ocekavane ztraty OG!
for i = 1:pocet_matic
    jmeno = name{i};
    kappaA  = kappa_A(i);             % cislo podminenosti matice
    normA   = norm_A(i);
    strojova_presnost = eps;
    
    fprintf(['***  ', jmeno ,' - ztrata ortogonality \n']);
    fprintf('CGS:    |Q^TQ-I|_2 = %e, ocekavani = %.1e  \n', ztrata_OG(1,i), OCEKAVANI_CGS);
    fprintf('MGS:    |Q^TQ-I|_2 = %e, ocekavani = %.1e  \n', ztrata_OG(2,i), OCEKAVANI_MGS);
%     fprintf('HH:     |Q^TQ-I|_2 = %e, ocekavani = %.1e  \n', ztrata_OG(3,i), OCEKAVANI_HH);
    fprintf('Givens: |Q^TQ-I|_2 = %e, ocekavani = %.1e  \n\n', ztrata_OG(4,i), OCEKAVANI_Givens);
      
end


