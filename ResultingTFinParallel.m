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

% parallel connection
G_parallel = parallel(G1, G2);
sys_tf=tf(G_parallel)

% Display the resulting transfer function
disp('Transfer function in parallel:');
disp(G_parallel);
