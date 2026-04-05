dane_rzeczywiste = [1.25, -2.5, 3.75, -4.0, 5.5, -6.25, 7.0, -8.5, 9.25, -10.0];

T_in = numerictype(1, 12, 4);
T_acc = numerictype(1, 20, 4);
A_fi = fi(dane_rzeczywiste, T_in);
Y_acc = fi(0, T_acc);

disp('--- Model Programowy Akumulatora (MATLAB) ---');
disp(' Takt | Wejście (Ułamek) | Wejście (Int) || Akumulator (Ułamek) | Akumulator (Int)');
disp('---------------------------------------------------------------------------------');

for i = 1:length(A_fi)
    current_A = A_fi(i);
    
    Y_acc = accumpos(Y_acc, current_A);
    A_int = current_A.int;
    Y_int = Y_acc.int;
    fprintf('  %2d  | %16.2f | %13d || %19.2f | %16d\n', ...
        i, double(current_A), A_int, double(Y_acc), Y_int);
end