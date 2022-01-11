function [x,y,z,nx,ny,nz,dx,dy,dz] = readmsh(infile_msh)
fp=fopen(infile_msh,'rt');
nx=fscanf(fp,'%d',1);ny=fscanf(fp,'%d',1);nz=fscanf(fp,'%d',1);
xmin=fscanf(fp,'%f',1);ymin=fscanf(fp,'%f',1);zmin=-fscanf(fp,'%f',1);
dxcc=fscanf(fp,'%s',1); lx=length(dxcc); a=strfind (dxcc ,'*'); dxc=dxcc((a+1):lx); 
dycc=fscanf(fp,'%s',1); ly=length(dycc); b=strfind (dycc ,'*'); dyc=dycc((b+1):ly);
dzcc=fscanf(fp,'%s',1); lz=length(dzcc); c=strfind (dzcc ,'*'); dzc=dzcc((c+1):lz);
dx=str2num(dxc); dy=str2num(dyc); dz=str2num(dzc);
fclose(fp);
xmin=xmin+dx/2;ymin=ymin+dy/2;zmin=zmin+dz/2;
xmax=xmin+(nx-1)*dx;ymax=ymin+(ny-1)*dy;zmax=zmin+(nz-1)*dz;
x=xmin:dx:xmax;y=ymin:dy:ymax;z=zmin:dz:zmax;
end