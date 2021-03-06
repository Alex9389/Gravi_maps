%%Listing A.2:
%% This function reads the spherical harmonic model
%function [Nmax,Ae,GM,C,S,dC,dS] = Modelread (filename)
%fid = fopen (filename ,'r');
%A1= fscanf (fid,'%g %g %g \n',3);
%Nmax=A1(1);
%Ae  =A1(2);
%GM  =A1(3);
%while (~feof(fid))
%  B=fscanf(fid,'%d %d %g %g %g %g \n',6);
%  n =B(1);
%  m =B(2);
%  C(n+1,m+1) =B(3);
%  S(n+1,m+1) =B(4);
%  dC(n+1,m+1)= B(5);
%  dS(n+1,m+1)= B(6);
%end
%fclose(fid);

function [Nmax,Ae,GM,C,S,dC,dS] = Modelread(filename)
fid = fopen (filename ,'r');
while (~feof(fid))
  search = fscanf (fid,'%s');
  if (search == 'gfc')
    B=fscanf(fid,'%d %d %g %g %g %g \n',6);
	n =B(1);
    m =B(2);
    C(n+1,m+1) =B(3);
    S(n+1,m+1) =B(4);
    dC(n+1,m+1)= B(5);
    dS(n+1,m+1)= B(6);
  elseif (search == 'earth_gravity_constant')
	GM = fscanf(fid,'%g');
	%перевести в числа
  elseif (search == 'radius')
	Ae = fscanf(fid,'%g');
	%перевести в числа
  elseif (search == 'max_degree')
	Nmax = fscanf(fid,'%s');
	%перевести в числа
  end
end
fclose(fid);