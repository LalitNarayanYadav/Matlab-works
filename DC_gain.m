clc;
clear all;
close all;
num1=[1 1];
num2=[1 3]
den1 = [1 0 0];
den2 = [1 2];
den3 = [1 3]
num = conv(num1, num2);
deno = conv(den1, den2);
den = conv(deno, den3);
% Use 'conv' to multiply the polynomials
%create TF
H=tf(num,den);
sys_tf=tf(H)
disp('transfer function H(s):');
disp(sys_tf);
syms s;

G = poly2sym(num, s) / poly2sym(den, s);  % Create symbolic expression
Kp = limit(G, s, 0);
disp('DC gain Kp:');
disp(Kp);
Kv = limit(s*G, s, 0);
disp('Kv:');
disp(Kv);
Ka = limit(s*s*G, s, 0);
disp('Ka:');
disp(Ka);

