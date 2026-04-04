A = 0.32345;
B = -0.78743;
C = 0.56532;

Y_double = (A + B) * C;
fprintf('Wynik idealny (double): %f\n', Y_double);

res = zeros(1, 17);
sign = 1;
prec_i = 1;

for prec_f = 0:16
    word = sign + prec_i + prec_f; % Całkowita długość słowa
    
    A_fix = fi(A, sign, word, prec_f);
    B_fix = fi(B, sign, word, prec_f);
    C_fix = fi(C, sign, word, prec_f);
    
    sum_fix = A_fix + B_fix;
    Y_fix = sum_fix * C_fix;
    
    error = abs(Y_double - double(Y_fix));
    
    res(prec_f + 1) = error;
end

figure;
plot(0:16, res, "b-o");
grid on;
yscale log;
xlabel('Liczba bitów ułamkowych (prec\_f)');
ylabel('Błąd bezwzględny obliczeń');
title('Wpływ precyzji ułamkowej na błąd operacji Y = (A + B) * C');