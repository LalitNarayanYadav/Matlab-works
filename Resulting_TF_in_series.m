clc;
clear all;
close all;
% Define the transfer functions
num1 = [1 0]; 
den1 = [1 2]; 
G1 = tf(num1, den1);

num2 = [1];   
den2 = [1 1];   
G2 = tf(num2, den2);

% Series connection
G_series = series(G1, G2);
sys_tf=tf(G_series)

% Display the resulting transfer function
disp('Transfer function in series:');
disp(G_series);

[num_series, den_series] = tfdata(G_series, 'v');
disp('Numerator polynomial (series):');
disp(num_series);
disp('Denominator polynomial (series):');
disp(den_series);
