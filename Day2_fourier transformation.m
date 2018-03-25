%fourier transfromation of message, carrier, dsbsc modulated and dsbsc demodulated 

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
demod=dsbsc.*cos(2*pi*fc*t); %dsbsc demodulated signal

%message signal
n=length(mt);
fourier_mt=abs(fftshift(fft(mt)));
f=[-n/2:n/2-1]/n;
subplot(4,1,1);
plot(f,fourier_mt);
title('message signal')
xlabel('f')
ylabel('amplitude')

%carrier signal
n=length(ct);
fourier_ct=abs(fftshift(fft(ct)));
f=[-n/2:n/2-1]/n;
subplot(4,1,2);
plot(f,fourier_ct);
title('carrier signal')
xlabel('f')
ylabel('amplitude')

%dsbsc modulated signal
n=length(dsbsc);
fourier_dsbsc=abs(fftshift(fft(dsbsc)));
f=[-n/2:n/2-1]/n;
subplot(4,1,3);
plot(f,fourier_dsbsc);
title('dsbsc modulated signal')
xlabel('f')
ylabel('amplitude')

%dsbsc demodulated signal
n=length(demod);
fourier_demod=abs(fftshift(fft(demod)));
f=[-n/2:n/2-1]/n;
subplot(4,1,4);
plot(f,fourier_demod);
title('dsbsc demodulated signal')
xlabel('f')
ylabel('amplitude')
