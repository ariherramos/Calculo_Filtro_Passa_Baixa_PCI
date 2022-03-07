clc
fim=501;
fim_s=301;

cabo_arquivo=fopen('tcc.txt');
cabo=fscanf(cabo_arquivo,'%f;%f;\n',[2,fim]);
fclose(cabo_arquivo);

filtro_arquivo=fopen('teste.txt');
filtro=fscanf(filtro_arquivo,'%f;%f;\n',[2,fim]);
fclose(filtro_arquivo);

simulacao_arquivo=fopen('simulacao.txt');
simulacao=fscanf(simulacao_arquivo,'%f,%f\n',[2,fim_s]);
fclose(simulacao_arquivo);

n=1;
x=linspace(1,501,501);
y=linspace(1,501,501);

x_s=linspace(1,301,301);
y_s=linspace(1,301,301);

while n<=fim
    x(n)=filtro(1,n);
    %y(n)=filtro(2,n)-cabo(2,n);
    y(n)=filtro(2,n);
    n=n+1;
end

n=1
while n<=fim_s
    x_s(n)=10E8*simulacao(1,n);
    y_s(n)=simulacao(2,n);
    n=n+1;
end

plot(x,y,'r')
hold on
plot(x_s,y_s,'b')
