clc
dat_fist=27;
dat_last=527;

cabo=str2double(table2array(readtable('cabo.dat','Delimiter',';','ReadVariableNames',false)));
filtro1=str2double(table2array(readtable('4.1_filtro.dat','Delimiter',';','ReadVariableNames',false)));
filtro4=str2double(table2array(readtable('4.4_filtro.dat','Delimiter',';','ReadVariableNames',false)));
filtro7=str2double(table2array(readtable('4.7_filtro.dat','Delimiter',';','ReadVariableNames',false)));

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

plot(x,y1,'k');
hold on;
plot(x,y4,'k');
hold on;
plot(x,y7,'k');

