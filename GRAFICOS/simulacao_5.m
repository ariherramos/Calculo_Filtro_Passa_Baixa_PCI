clc
dat_first=26;
dat_last=527;

simulacao1=csvread ('sim_chevyshev_5.csv',2,0);
simulacao7=csvread ('sim_butterworth_5.csv',2,0);
simulacao4=csvread ('sim_cauer_5.csv',2,0);


x_s=linspace(1,301,301);
y_s1=linspace(1,301,301);
y_s4=linspace(1,301,301);
y_s7=linspace(1,301,301);
n=1;

while n<=length(simulacao4)
    x_s(n)=10E8*simulacao4(n,1);
    y_s1(n)=simulacao1(n,2);
    y_s4(n)=simulacao4(n,2);
    y_s7(n)=simulacao7(n,2);
    n=n+1;
end

hold on;
plot(x_s,y_s1,'r');
hold on;
plot(x_s,y_s4,'g');
hold on;
plot(x_s,y_s7,'b');

legend('Chevyshev','Cauer','Butterworth');
title('5 ordem');
ylabel ( 'dB(S21)' );
xlabel ( 'Frequência (GHz)' );