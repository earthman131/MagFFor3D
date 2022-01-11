function [k,kx,ky,kz] = wave3d(npts,dx,dy,dz) 
k=zeros(npts,npts,npts);kx=zeros(npts,npts,npts);
ky=zeros(npts,npts,npts);kz=zeros(npts,npts,npts);
wnx=(2*pi)/(dx*(npts-1)); wny=(2*pi)/(dy*(npts-1)); wnz=(2*pi)/(dz*(npts-1));
cx=npts/2+1; cy=npts/2+1; cz=npts/2+1;
for K=1:npts
for I=1:npts
    for J= 1:npts
        kz(I,J,K)=(K-cz)*wnz;
        ky(I,J,K)=(I-cy)*wny;
        kx(I,J,K)=(J-cx)*wnx;
        k(I,J,K)=sqrt(kx(I,J,K)*kx(I,J,K)+ky(I,J,K)*ky(I,J,K)+kz(I,J,K)*kz(I,J,K));
    end
end
end