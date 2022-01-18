function [F,M] = getINDE(inclination,declination)
I0=(inclination)*(pi/180); A0=(90-(declination))*(pi/180);
I1=(inclination)*(pi/180); A1=(90-(declination))*(pi/180); 
Fx=cos(I0)*cos(A0); Fy=cos(I0)*sin(A0);Fz=sin(I0);
Mx=cos(I1)*cos(A1);My=cos(I1)*sin(A1);Mz=sin(I1);
F=[Fx Fy Fz];M=[Mx My Mz];
end
