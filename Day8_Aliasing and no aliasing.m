% Aliasing and No Aliasing demonstration 

clear all;
close all;
clc;

t=-1:0.01:1;

x=(t==0); %single impulse function
subplot(2,2,1)
plot(t,x)
title('Single impulse Function')
xlabel('Time')
ylabel('Amplitude')

fs=100;
N=length(t);
xf=abs(fftshift(fft(x,N)/N)); %fourier transformation of x 
f=linspace(-fs/2,fs/2,N);
subplot(2,2,2)
plot(f,ceil(xf))
title('Fourier transformation')
xlabel('Frequency')
ylabel('Amplitude')

fm=2;
y=sin(2*pi*fm*t);
subplot(2,2,3)
plot(t,y)
title('Sine wave')
xlabel('Time')
ylabel('Amplitude')

yf=abs(fftshift(fft(y,N)/N)); %fourier transformation of sine wave y
subplot(2,2,4)
plot(f,yf)
title('Fourier transformation')
xlabel('Frequency')
ylabel('Amplitude')

figure

Fs=5*fm;
t1=-1:1/Fs:1;
y1=sin(2*pi*fm*t1);
subplot(2,1,1)
plot(t,y)
hold on
stem(t1,y1)
hold off
title('NO ALIASING')
xlabel('Time')
ylabel('Amplitude')

Fs=1.5*fm;
t1=-1:1/Fs:1;
y1=sin(2*pi*fm*t1);
subplot(2,1,2)
plot(t,y)
hold on
stem(t1,y1)
hold off
title('ALIASING')
xlabel('Time')
ylabel('Amplitude')