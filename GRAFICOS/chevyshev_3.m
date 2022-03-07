clc
dat_first=26;
dat_last=527;

cabo=str2double(table2array(readtable('cabo.dat','Delimiter',';','ReadVariableNames',false)));
filtro1=str2double(table2array(readtable('Chevyshev_3_ordem.dat','Delimiter',';','ReadVariableNames',false)));
simulacao1=csvread ('sim_chevyshev_3.csv',2,0);


n=dat_first+1;
k=0;
x=linspace(0,3E9,501);
y1=linspace(1,501,501);



while n<=dat_last
    k=k+1;
    y1(k)=filtro1(n,2)-cabo(n,2);

    n=n+1;
end

plot(x,y1,'r');

x_s=linspace(1,301,301);
y_s1=linspace(1,301,301);
n=1;
while n<=length(simulacao1)
    x_s(n)=10E8*simulacao1(n,1);
    y_s1(n)=simulacao1(n,2);
    n=n+1;
end

hold on;
plot(x_s,y_s1,'b');


legend('Pratica','Simulação');
title('Chevyshev 3 ordem');
ylabel ( 'dB(S21)' );
xlabel ( 'Frequência (GHz)' );