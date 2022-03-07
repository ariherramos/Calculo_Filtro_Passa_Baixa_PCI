 clc;

g0=1;
g1=1.0316;
g2=1.1474;
g3=1.0316;
g4=1;

fc=1E9;
Z0=50;

L=(Z0/g0)*(g2/(2*pi*fc))
C=(g0/Z0)*(g1/(2*pi*fc))

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
Lmb_l=300E9/(fc*(Ere_L)^(1/2))
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
Lmb_c=300E9/(fc*(Ere_C)^(1/2))
Beta=2*pi/Lmb_c

%%
%    CALCULO DA LARGURA
%%
wc=fc*2*pi;
fc
%Ll=Lmb_l/(2*pi)*asin(wc*L/Z0L)

% syms Lc
% eqn =(1/Z0C)*tan(2*pi*Lc/Lmb_c)+2*(1/Z0L)*tan(pi*Ll/Lmb_l) == wc*C;
% S = solve(eqn, Lc)
% S.Lc

Ll_1=Lmb_l/(2*pi)*asin(wc*L/Z0L)
LC_1=Lmb_c/(2*pi)*asin(wc*C*Z0C)

asin(wc*L/Z0L)
asin(wc*C*Z0C)

L_total=2*LC_1+Ll_1+8

% C_do_L=1/(wc*Z0L)*tan(Ll_1*2*pi/Lmb_l)
% L_do_C=Z0C/wc*sin(LC_1*2*pi/Lmb_c)