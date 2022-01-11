function pex = extend_copy3d(p,nx,ny,nz,npts)
pex=zeros(npts,npts,npts); 
ydiff=floor((npts-ny)/2);
xdiff=floor((npts-nx)/2);
zdiff=floor((npts-nz)/2);
pex((ydiff+1):(ydiff+ny),(xdiff+1):(xdiff+nx),(zdiff+1):(zdiff+nz))=p;
for i=1:ydiff % y方向
    pex(i,:,:)=pex(1+ydiff,:,:);
end
for i=(ydiff+ny+1):npts
    pex(i,:,:)=pex(ny+ydiff,:,:);
end
for i=1:xdiff % x方向
    pex(:,i,:)=pex(:,1+xdiff,:);
end
for i=(xdiff+nx+1):npts
    pex(:,i,:)=pex(:,xdiff+nx,:);
end
for i=1:zdiff % z方向
    pex(:,:,i)=0;
end
for i=(zdiff+nz+1):npts
    pex(:,:,i)=0;
end

