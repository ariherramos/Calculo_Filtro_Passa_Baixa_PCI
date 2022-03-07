clc;

g0=1;
g1=1.0876;%L1
g2=1.2932;%C2
g2L=0.0732;%L2
g3=1.7939;%L3
g4=1.1433;%C4
g4L=0.2004;%L4
g5=0.9772;%L5
g6=1;

fc=1E9;
Z0=50;

L1=(Z0/g0)*(g1/(2*pi*fc))
L2=(Z0/g0)*(g2L/(2*pi*fc))
C2=(g0/Z0)*(g2/(2*pi*fc))
L3=(Z0/g0)*(g3/(2*pi*fc))
L4=(Z0/g0)*(g4L/(2*pi*fc))
C4=(g0/Z0)*(g4/(2*pi*fc))
L5=(Z0/g0)*(g5/(2*pi*fc))


%%
Z0L=114.1796;
Z0C=12.1297;

Er=4.1;
h=1.5306;
n=120*pi;

%%
%    CALCULO DA ESPESSURA
%%
% Wheeler and Hammerstad 
% Indutor
A=Z0L/60*((Er+1)/2)^(0.5)+((Er-1)/(Er+1))*(0.23+0.11/Er);
Wh_1=8*exp(A)/(exp(2*A)-2);
W_novo1=Wh_1*h;
B=60*pi^2/(Z0L*(Er)^(1/2));
Wh_2=2/pi*((B-1)-log(2*B-1)+((Er-1)/(2*Er))*(log(B-1)+0.39-0.61/Er));
W_novo2=Wh_2*h;

if Wh_1<=2
   Wmicro_indutor=W_novo1
else
   Wmicro_indutor=W_novo2
end

% Comprimento de onda
W_h=Wmicro_indutor/h;
if W_h >= 1 
    % Hammerstad and Jensen W/h>=1
    u=Wmicro_indutor/h;
    a=1+(1/49)*log((u^4+(u/52)^2)/(u^4+0.432))+(1/18.7)*log(1+(u/18.1)^3);
    b=0.564*((Er-0.9)/(Er+3))^(0.053);
    Ere_L=(Er+1)/2+((Er-1)/2)*(1+10/u)^(-a*b);

else
    Ere_L=(Er+1)/2+((Er-1)/2)*((1+12*h/Wmicro_indutor)^(-0.5)+0.04*(1-Wmicro_indutor/h)^2);
end
Lmb_l=300/(Ere_L)^(1/2)
Beta=2*pi/Lmb_l

%%
% Wheeler and Hammerstad 
% Capacitor
A=Z0C/60*((Er+1)/2)^(0.5)+((Er-1)/(Er+1))*(0.23+0.11/Er);
Wh_1=8*exp(A)/(exp(2*A)-2);
W_novo1=Wh_1*h;
B=60*pi^2/(Z0C*(Er)^(1/2));
Wh_2=2/pi*((B-1)-log(2*B-1)+((Er-1)/(2*Er))*(log(B-1)+0.39-0.61/Er));
W_novo2=Wh_2*h;

if Wh_1<=2
   Wmicro_capacitor=W_novo1
else
   Wmicro_capacitor=W_novo2
end
% Comprimento de onda
W_h=Wmicro_capacitor/h
if W_h >= 1 
    % Hammerstad and Jensen W/h>=1
    u=Wmicro_capacitor/h;
    a=1+(1/49)*log((u^4+(u/52)^2)/(u^4+0.432))+(1/18.7)*log(1+(u/18.1)^3);
    b=0.564*((Er-0.9)/(Er+3))^(0.053);
    Ere_C=(Er+1)/2+((Er-1)/2)*(1+10/u)^(-a*b);

else
    Ere_C=(Er+1)/2+((Er-1)/2)*((1+12*h/Wmicro_capacitor)^(-0.5)+0.04*(1-Wmicro_capacitor/h)^2);
end
Lmb_c=300/(Ere_C)^(1/2)
Beta=2*pi/Lmb_c

%%
%    CALCULO DA LARGURA
%%
wc=fc*2*pi;

Ll1=Lmb_l/(2*pi)*asin(wc*L1/Z0L)
Ll2=Lmb_l/(2*pi)*asin(wc*L2/Z0L)
Ll3=Lmb_l/(2*pi)*asin(wc*L3/Z0L)
Ll4=Lmb_l/(2*pi)*asin(wc*L4/Z0L)
Ll5=Lmb_l/(2*pi)*asin(wc*L5/Z0L)
LC2=Lmb_c/(2*pi)*atan(wc*C2*Z0C)
LC4=Lmb_c/(2*pi)*atan(wc*C4*Z0C)