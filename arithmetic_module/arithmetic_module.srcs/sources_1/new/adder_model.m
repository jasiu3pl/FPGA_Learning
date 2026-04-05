A_val = 1.7;
B_val = 2.5;

A_fix = fi(A_val, 1, 17, 8);
B_fix = fi(B_val, 1, 7, 3);
X_fix = A_fix + B_fix;

disp(num2str(A_fix));
disp(num2str(B_fix));
disp('--- Wyniki operacji X = A + B ---');
disp(['Idealne A + B: ', num2str(A_val + B_val)]);
disp(['Wynik z modelu stalo-przecinkowego: ', num2str(double(X_fix))]);
disp(['Bledy obliczen: ', num2str(abs((A_val + B_val) - double(X_fix)))]);

disp('Format wyniku X wyliczony przez Matlab:');
disp(X_fix)