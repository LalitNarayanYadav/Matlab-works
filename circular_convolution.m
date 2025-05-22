clc; 
clear; 
close; 
x1=[1 1 2 2]; 
x2=[1 2 3 4]; 
L=length(x1); 
M=length(x2); 
N=max(L,M) 
%Calculation of circular convolution 
for n=1:N 
    y(n)=0;
    for k=1:N,
        l=n-k+1; 
        if l <= 0 l=l+N; 
        end 
        y(n)=y(n)+(x1(k)*x2(l)); 
    end 
end 
%Calculation of circular convolution using DFT and IDFT 
X1=fft(x1); 
X2=fft(x2); 
Y1=X1.*X2; 
y1=ifft(Y1); 
d1= ['Circular Convolution sequence calculated using DFT-IDFT method is y(n): ', num2str(y1)]; 
disp(d1)