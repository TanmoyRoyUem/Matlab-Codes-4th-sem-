%dsbsc modulation and fourier transformation

close all
clear all
clc
    
am=input('amplitude of message signal=');
fm=input('frequency of message signal=');
ac=input('amplitude of carrier signal=');
fc=input('frequency of carrier signal=');

t=0:0.001:1;

mt=am*cos(2*pi*fm*t); %message signal
ct=ac*cos(2*pi*fc*t); %carrier signal
dsbsc=mt.*cos(2*pi*fc*t); %dsbsc modulated signal

%fourier transformation
n=length(dsbsc);
fourier_dsbsc=abs(fftshift(fft(dsbsc)));
f=[-n/2:n/2-1]/n;

%message signal
subplot(4,1,1);
plot(t,mt);
title('message signal')
xlabel('t')
ylabel('amplitude')

%carrier signal
subplot(4,1,2);
plot(t,ct);
title('carrier signal')
xlabel('t')
ylabel('amplitude')

%dsbsc modulated signal
subplot(4,1,3);
plot(t,dsbsc);
title('dsbsc modulated signal')
xlabel('t')
ylabel('amplitude')

%fourier dsbsc modulated signal
subplot(4,1,4);
plot(f,fourier_dsbsc);
title('fourier dsbsc modulated signal')
xlabel('f')
ylabel('amplitude')
