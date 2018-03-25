%psk modulation and demodulation

clc;
close all;
clear all;

m=rand(1,8);
l=length(m);
for i=1:1:l
    if m(i)>= 0.5
        m(i)=1;
    else
        m(i)=0;
    end
end
m(l+1)=1;
tn=0:l;

t=0:0.001:l;
c=sin(2*pi*5*t);

subplot(4,1,1);
stairs(tn,m,'r');
title('Message Signal');
ylabel('Amplitude');
xlabel('Time');

subplot(4,1,2);
plot(t,c,'b');
title('Carrier Signal');
ylabel('Amplitude');
xlabel('Time');

 for i=1:l
     for j=(i-1)*1000:i*1000
         if m(i)==1
             psk(j+1)=c(j+1);
         else
             psk(j+1)=-c(j+1);
         end
     end
end;

subplot(4,1,3);
plot(t,psk,'g');
title('PSK Modulated Signal');
ylabel('Amplitude');
xlabel('Time');

for i=1:length(t);
 y=c(i)*psk(i);
 if y>0;
 demod(i)=1;
 else;
 demod(i)=0;
 end;
end;
subplot(4,1,4);
plot(t,demod,'m');
title('PSK Demodulated Signal');
ylabel('Amplitude');
xlabel('Time');