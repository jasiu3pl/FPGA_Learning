disp('--- Model Programowy: Mnożenie Macierzowe ---');

T_in = numerictype(1, 12, 4); 
C11 = fi(-0.11, T_in);
C12 = fi(2.3, T_in);
C21 = fi(3.14, T_in);
C22 = fi(-11.25, T_in);

A_real = [1.5, -2.0, 10.25, -15.5, 0, 127.9375, -128.0, 50.0];
B_real = [0.5,  3.25, -5.0,  20.0, 0, -128.0,   127.9375, -50.0];

A_fi = fi(A_real, T_in);
B_fi = fi(B_real, T_in);

disp(' Takt |    A (int) |    B (int) ||    Y (int) |    Z (int) ');
disp('-------------------------------------------------------------');

for i = 1:8
    current_A = A_fi(i);
    current_B = B_fi(i);
    
    Y_acc = C11 * current_A + C12 * current_B;
    Z_acc = C21 * current_A + C22 * current_B;
    
    fprintf('  %2d  | %10d | %10d || %10d | %10d\n', ...
        i, current_A.int, current_B.int, Y_acc.int, Z_acc.int);
end