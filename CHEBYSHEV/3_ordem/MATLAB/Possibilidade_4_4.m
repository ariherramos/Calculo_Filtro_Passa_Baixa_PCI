clc 
 
Er=4.4;
n=120*pi;
h=1.6-(2*0.0347)

W_min=0.5;%quanto menor, maior impedancia
W_max=20;%quanto maior, menor impedancia

W_h_min=W_min/h;

if W_h_min >= 1 
    % Hammerstad and Jensen W/h>=1
    u=W_min/h;
    a=1+(1/49)*log((u^4+(u/52)^2)/(u^4+0.432))+(1/18.7)*log(1+(u/18.1)^3);
    b=0.564*((Er-0.9)/(Er+3))^(0.053);
    Ere_2=(Er+1)/2+((Er-1)/2)*(1+10/u)^(-a*b);
    F=6+(2*pi-6)*exp(-(30.666/u)^(0.7528));
    Zc_2=n/(2*pi*(Ere_2)^(1/2))*log(F/u+(1+(2/u)^2)^(1/2))

else
    Ere_3=(Er+1)/2+((Er-1)/2)*((1+12*h/W_min)^(-0.5)+0.04*(1-W_min/h)^2);
    Zc_3=n/(2*pi*(Ere_3)^(1/2))*log(8*h/W_min+0.25*W_min/h)
end

W_h_max=W_max/h;

if W_h_max >= 1 
    % Hammerstad and Jensen W/h>=1
    u=W_max/h;
    a=1+(1/49)*log((u^4+(u/52)^2)/(u^4+0.432))+(1/18.7)*log(1+(u/18.1)^3);
    b=0.564*((Er-0.9)/(Er+3))^(0.053);
    Ere_2=(Er+1)/2+((Er-1)/2)*(1+10/u)^(-a*b);
    F=6+(2*pi-6)*exp(-(30.666/u)^(0.7528));
    Zc_2=n/(2*pi*(Ere_2)^(1/2))*log(F/u+(1+(2/u)^2)^(1/2))

else
    Ere_3=(Er+1)/2+((Er-1)/2)*((1+12*h/W_max)^(-0.5)+0.04*(1-W_max/h)^2);
    Zc_3=n/(2*pi*(Ere_3)^(1/2))*log(8*h/W_max+0.25*W_max/h)
end

Zc=50;

A=Zc/60*((Er+1)/2)^(0.5)+((Er-1)/(Er+1))*(0.23+0.11/Er);
Wh_1=8*exp(A)/(exp(2*A)-2);
W_novo1=Wh_1*h;

B=60*pi^2/(Zc*(Er)^(1/2));
Wh_2=2/pi*((B-1)-log(2*B-1)+((Er-1)/(2*Er))*(log(B-1)+0.39-0.61/Er));
W_novo2=Wh_2*h;

if Wh_1<=2
   Wmicro_50=W_novo1
else
   Wmicro_50=W_novo2
end

u=Wmicro_50/h;
a=1+(1/49)*log((u^4+(u/52)^2)/(u^4+0.432))+(1/18.7)*log(1+(u/18.1)^3);
b=0.564*((Er-0.9)/(Er+3))^(0.053);
Ere_Z=(Er+1)/2+((Er-1)/2)*(1+10/u)^(-a*b);

Lmb_50=300/(Ere_Z)^(1/2)
