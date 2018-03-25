%psk modulation for f=2,4,6,8,10
clc;
close all;
clear all;

t=0:0.001:1;
for i=1:5;
f=input('Enter frequency:=>');
tb=1;
Eb=1;
m=(square(2*pi*f*t));
c=sqrt((2*Eb)/tb)*sin(2*pi*20*t);
psk=c.*m;

subplot(5,1,i);
plot(t,psk,'m');
title('PSK Modulated Signal');
ylabel('Amplitude');
xlabel('Time');
end;
