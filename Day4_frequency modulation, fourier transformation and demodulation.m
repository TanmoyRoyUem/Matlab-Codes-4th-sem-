% Frequency modulation, fourier transformation and demodulation

clc;
close all;
clear all;
t=0:0.001:1;
am=input('Enter message amplitude: ');
fm=input('Enter message frequency: ');
ac=input('Enter carrier amplitude: ');
fc=input('Enter carrier frequency: ');
b=input('Enter value of modulation index: ');

% message signal
mt=am*cos(2*pi*fm*t);
subplot(5,1,1)
plot(t,mt,'r')
title('MESSAGE SIGNAL')
xlabel('time')
ylabel('amplitude')

% carrier signal
c=ac*cos(2*pi*fc*t);
subplot(5,1,2)
plot(t,c,'r')
title('CARRIER SIGNAL')
xlabel('time')
ylabel('amplitude')

% frequency modulation
FM=ac*cos((2*pi*fc*t)+(b*sin(2*pi*fm*t)));
subplot(5,1,3)
plot(t,FM,'r')
title('FREQUENCY MODULATED SIGNAL')
xlabel('time')
ylabel('amplitude')

% fourier transformation
n=length(FM);
Mif=abs(fftshift(fft(FM)));
f=[-(n/2):((n/2)-1)]/n;
subplot(5,1,4)
plot(f,Mif,'b')
title('FREQUENCY SPECTRUM')
xlabel('frequency')
ylabel('amplitude')

% demodulated signal with filter
dem1=diff(FM);
dem1=[0 dem1];
dem=abs(dem1);
[b,a]=butter(10,0.1);
dem2=filter(b,a,dem);
subplot(5,1,5)
plot(t,dem2)
title('DEMODULATED FM SIGNAL')
xlabel('time')
ylabel('amplitude')

