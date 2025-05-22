clc;
clear all;
close all;
num=[5 1 0];
deno = [3 1 2 10]
%create TF
H=tf(num,deno);
sys_tf=tf(H)

disp('transfer function H(s):');
disp(sys_tf);
pzmap(sys_tf)
title("Pole zero plot");
xlabel("real axis--->");
ylabel("Imaginary axis--->");
rlocus(sys_tf);
