%fsk modulation and demodulation

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
c1=sin(2*pi*5*t);
c2=sin(2*pi*10*t);

subplot(5,1,1);
stairs(tn,m);
title('Message Signal');
ylabel('Amplitude');
xlabel('Time');

subplot(5,1,2);
plot(t,c1);
title('Carrier Signal 1');
ylabel('Amplitude');
xlabel('Time');

subplot(5,1,3);
plot(t,c2);
title('Carrier Signal 2');
ylabel('Amplitude');
xlabel('Time');

for i=1:l
    for j=(i-1)*1000:i*1000
    if m(i)==1;
        FSK(j+1)=c1(j+1);
    else
        FSK(j+1)=c2(j+1);
    end
    end;
end;

subplot(5,1,4);
plot(t,FSK);
title('FSK Signal');
ylabel('Amplitude');
xlabel('Time');

for i=1:length(t)
    if FSK(i)==c1(i)
        demod(i)=1;
    else
        demod(i)=0;
    end
end
    
subplot(5,1,5);
plot(t,demod);
title('Demodulated FSK Signal ')
ylabel('Amplitude');
xlabel('Time');        
