function p = readmod(infile_mod,nx,ny,nz)
p=zeros(ny,nx,nz);
fp=fopen(infile_mod,'rt');
for a=1:ny
    for b=1:nx
        for c=1:nz
            tmp=fscanf(fp,'%g',1);
            p(a,b,c)=tmp;
        end
    end
end
fclose(fp);
