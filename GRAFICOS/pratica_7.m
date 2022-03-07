clc
dat_first=26;
dat_last=527;

cabo=str2double(table2array(readtable('cabo.dat','Delimiter',';','ReadVariableNames',false)));
filtro1=str2double(table2array(readtable('Chevyshev_7_ordem.dat','Delimiter',';','ReadVariableNames',false)));
filtro4=str2double(table2array(readtable('Cauer_7_ordem.dat','Delimiter',';','ReadVariableNames',false)));
filtro7=str2double(table2array(readtable('Butterworth_7_ordem.dat','Delimiter',';','ReadVariableNames',false)));

n=dat_first+1;
k=0;
x=linspace(0,3E9,501);
y1=linspace(1,501,501);
y4=linspace(1,501,501);
y7=linspace(1,501,501);


while n<=dat_last
    k=k+1;
%     y1(k)=filtro1(n,2)-cabo(n,2);
%     y4(k)=filtro4(n,2)-cabo(n,2);
%     y7(k)=filtro7(n,2)-cabo(n,2);
    y1(k)=filtro1(n,2);
    y4(k)=filtro4(n,2);
    y7(k)=filtro7(n,2);
    n=n+1;
end

plot(x,y7,'b');
hold on;
plot(x,y4,'g');
hold on;
plot(x,y1,'r');

legend('Butterworth','Cauer','Chevyshev');
title('7 ordem');
ylabel ( 'dB(S21)' );
xlabel ( 'Frequência (GHz)' );