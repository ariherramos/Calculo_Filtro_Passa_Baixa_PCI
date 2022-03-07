clc
dat_first=26;
dat_last=527;

cabo=str2double(table2array(readtable('cabo.dat','Delimiter',';','ReadVariableNames',false)));
filtro1=str2double(table2array(readtable('4.1_filtro.dat','Delimiter',';','ReadVariableNames',false)));
filtro4=str2double(table2array(readtable('4.4_filtro.dat','Delimiter',';','ReadVariableNames',false)));
filtro7=str2double(table2array(readtable('4.7_filtro.dat','Delimiter',';','ReadVariableNames',false)));
simulacao1=csvread ('curvas4.1.csv',2,0);
simulacao4=csvread ('curvas4.4.csv',2,0);
simulacao7=csvread ('curvas4.7.csv',2,0);

n=dat_first+1;
k=0;
x=linspace(0,3E9,501);
y1=linspace(1,501,501);
y4=linspace(1,501,501);
y7=linspace(1,501,501);


while n<=dat_last
    k=k+1;
    y1(k)=filtro1(n,2)-cabo(n,2);
    y4(k)=filtro4(n,2)-cabo(n,2);
    y7(k)=filtro7(n,2)-cabo(n,2);
    n=n+1;
end

plot(x,y1,'r');
hold on;
plot(x,y4,'g');
hold on;
plot(x,y7,'b');

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
