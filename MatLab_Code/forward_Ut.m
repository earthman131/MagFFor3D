function Ut = forward_Ut(Mex,u0,M,F,nx,ny,nz,npts,dx,dy,dz)
[k,kx,ky,kz] = wave3d(npts,dx,dy,dz);
Mf=fftshift(fftn(Mex));
ydiff=floor((npts-ny)/2);xdiff=floor((npts-nx)/2);zdiff=floor((npts-nz)/2);
Cm=M(1)*kx+M(2)*ky+M(3)*kz;
Cf=F(1)*kx+F(2)*ky+F(3)*kz;
Utf=u0*Mf.*(-Cf.*Cm+eps)./(k.^2+eps);
Ut=ifftn(ifftshift(Utf));
Ut=real(Ut((ydiff+1):(ydiff+ny),(xdiff+1):(xdiff+nx),(zdiff+1):(zdiff+nz)))*1e9;  
Ut=Ut(:,:,1); 
end