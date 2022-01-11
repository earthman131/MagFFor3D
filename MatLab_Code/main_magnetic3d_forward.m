% Description of the input parameters: 
%       infile_msh: model mesh file
%       infile_mod: model density file, unit: A/m
%       inclination, declination：geomagnetic inclination and declination 
%                  The direction of magnetization is consistent with the direction of geomagnetic field
% Description of the output parameters: 
%       outfile_Ut: calculated anomaly
% Description of primary identifiers：
%       x, y: x, y verctor
%       nx, ny: number of points in x and y directions
%       dx, dy: spacing in x and y directions
%       npts: extension points
%       m：magnetization distribution, unit: A/m
%       u0：vacuum magnetic permeability, unit: Henry/m
%       mex：magnetization distribution after extension
%       F：geomagnetic field direction vector
%       M：magnetization direction vector
%       Ut：magnetic anomaly, unit: nT
% Description of subroutine function: 
%       readmsh.m: read mesh file
%       readmod.m: read model file
%       wave3d.m: calculate wavenumber
%       getINDE.m：calculate geomagnetic field direction vector and magnetization direction vector
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
