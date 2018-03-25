%Phase modulation for kp=2,4,6,8,10

clc;
close all;
clear all;

t=0:0.001:1;

am=input('Enter message amplitude: ');
fm=input('Enter message frequency: ');
ac=input('Enter carrier amplitude: ');
fc=input('Enter carrier frequency: ');

mt=am*cos(2*pi*fm*t);
ct=ac*cos(2*pi*fc*t);

for i=1:1:5
    
kp=input('Enter value of phase sensitivity: ');
pt=ac*cos((2*pi*fc*t)+kp*mt); %phase modulated signal

subplot(5,1,i);
plot(t,pt);
title('PHASE MODULATED SIGNAL')
xlabel('time')
ylabel('amplitude')

end