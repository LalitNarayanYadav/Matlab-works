dx = 3*pi/30;
x = 0:dx:3*pi;
f = sin(x).^2 .* cos(x);
subplot(2,1,1)
plot(x,f,'o')
title('Plot the function f as sample points')
%Use FFT interpolation to find the function value at 200 query points.
N = 200;
y = interpft(f,N);
%Calculate the spacing of the interpolated data from the spacing of the sample points with dy =dx*length(x)/N, where N is the number of interpolation points. Truncate the data in y to matchthe sampling density of x2.
dy = dx*length(x)/N;
x2 = 0:dy:3*pi;
y = y(1:length(x2));
%Plot the results.
hold on
subplot(2,1,2)
plot(x2,y,'.')
title('FFT Interpolation of Periodic Function')
