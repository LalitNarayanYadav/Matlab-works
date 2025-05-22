clc;
clear all;
close all;

% Taking input
m = input('Enter the first sequence: ');
n = input('Enter the second sequence: ');

% Calculate the length of the two sequences
L1 = length(m);
L2 = length(n);

% Calculate the length of the output sequence
L = L1 + L2 - 1;

% Append zeros at the end of the sequence
x1 = [m, zeros(1, L - L1)];
x2 = [n, zeros(1, L - L2)];

% Function for calculating DFT of a sequence
function [DFT] = calculateDFT(x, L)
    DFT = zeros(1, L); % Initialize DFT
    for k = 1:L
        for n = 1:L
            DFT(k) = DFT(k) + x(n) * exp((-1i * 2 * pi * (n - 1) * (k - 1)) / L);
        end
    end
end

% Function for calculating IDFT of a sequence
function [IDFT] = calculateIDFT(Yk, L)
    IDFT = zeros(1, L); % Initialize IDFT
    for n = 1:L
        for k = 1:L
            IDFT(n) = IDFT(n) + Yk(k) * exp((1i * 2 * pi * (n - 1) * (k - 1)) / L);
        end
        IDFT(n) = IDFT(n) / L;  % Normalize by L
    end
end

% Calculating DFT
X1n = calculateDFT(x1, L);
X2n = calculateDFT(x2, L);

% Calculating Y(k) = X1(k) * X2(k)
Yk = X1n .* X2n;  % Element-wise multiplication

% Calculating IDFT to get the linear convolution
y1 = calculateIDFT(Yk, L);

% Display the result
disp('Linear Convolution of the given sequences:');
disp(y1);
y2=conv(m,n)
y=round(y1,0);
if(y==y2)
    disp('Verified');
else
    disp('not verified');
end
