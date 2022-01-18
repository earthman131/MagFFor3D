%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% A wavenumber-domain approach for 3-D forward modeling of magneitc anomalies and gradients.
% Author: Yatong Cui, Lianghui Guo (guolh@cugb.edu.cn)
% Organization: China University of Geosciences (Beijing), School of Geophysics and Information Technology
% Compiled version: MATLAB R2017b
% Reference:
%       Tontini F C, Cocchi L, and Carmisciano C. Rapid 3-D forward model of potential fields
%       with application to the Palinuro Seamount magnetic anomaly (southern Tyrrhenian Sea,
%       Italy). Journal of Geophysical Research, 2009.
% Description of the input parameters: 
%       infile_msh: model mesh file
%       infile_mod: model density file, unit: A/m
%       inclination, declination£ºgeomagnetic inclination and declination 
%                  The direction of magnetization is consistent with the direction of geomagnetic field
% Description of the output parameters: 
%       outfile_Ut: calculated anomaly
% Description of primary identifiers£º
%       x, y: x, y verctor
%       nx, ny: number of points in x and y directions
%       dx, dy: spacing in x and y directions
%       npts: extension points
%       m£ºmagnetization distribution, unit: A/m
%       u0£ºvacuum magnetic permeability, unit: Henry/m
%       mex£ºmagnetization distribution after extension
%       F£ºgeomagnetic field direction vector
%       M£ºmagnetization direction vector
%       Ut£ºmagnetic anomaly, unit: nT
% Description of subroutine function: 
%       readmsh.m: read mesh file
%       readmod.m: read model file
%       wave3d.m: calculate wavenumber
%       getINDE.m£ºcalculate geomagnetic field direction vector and magnetization direction vector
%       extend_copy3d.m: copy edge extension
%       forward_Ut.m: calculated magnetic anomaly
%       savegrd.m: save surfer text grd file
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clc;
clear;
close all;
%%%%%%%%%%%% I/O parameters %%%%%%%%%%%%%
infile_msh = 'model_stack5_101_101_41.msh'; 
infile_mod = 'model_stack5_101_101_41.mod';
inclination = 60;
declination = 45;
outfile_Ut = 'Ut_3D.grd'; 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[x,y,z,nx,ny,nz,dx,dy,dz] = readmsh(infile_msh);
m = readmod(infile_mod,nx,ny,nz); 
nmax = max([nx ny nz]);
npts = 2^nextpow2(nmax);
mex = extend_copy3d(m,nx,ny,nz,npts); 
u0 = 4*pi*10^(-7);
[F,M] = getINDE(inclination,declination);
% forward
Ut = forward_Ut(mex,u0,M,F,nx,ny,nz,npts,dx,dy,dz);
% save
savegrd(Ut,x,y,nx,ny,outfile_Ut);