function psp_chst1(f,cl,freq,label)
% psp_chst1(f,cl,freq,label)
% function to plot coherence histogram in current figure/subplot window
% plots estimate in column 7 of f matrix, from output of pooled analysis.
%
% Copyright (C) 2008, David M. Halliday.
% This file is part of NeuroSpec.
%
%    NeuroSpec is free software; you can redistribute it and/or modify
%    it under the terms of the GNU General Public License as published by
%    the Free Software Foundation; either version 2 of the License, or
%    (at your option) any later version.
%
%    NeuroSpec is distributed in the hope that it will be useful,
%    but WITHOUT ANY WARRANTY; without even the implied warranty of
%    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
%    GNU General Public License for more details.
%
%    You should have received a copy of the GNU General Public License
%    along with NeuroSpec; if not, write to the Free Software
%    Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
%
%    NeuroSpec is available at:  http://www.neurospec.org/
%     Contact:  contact@neurospec.org
%  
% f,cl     Ouput from pooled spectral analysis routine, pool_scf_out().
% freq     Frequency limit for plotting (Hz).
% label    Optional title instead of cl.what.
%
% psp_chst1(f,cl,freq,label)

if (nargin<3)
  error('Not enough input arguments')
end  

%freq_pts=round(freq/cl.df);
%Updated to support type 2 analysis
f_start=f(1,1,1);
freq_pts=round((freq-f_start)/cl.df)+1;

% Check this is output from pool_scf_out.m
if (isfield(cl,'pl_fil_tot')==0)
  error('Results not generated by pool_scf_out.m');
end
%Check freq range
[x,y]=size(f);
if (y<7)
  error('No data to plot in f.');
end
if (freq_pts>x)
  error('Requested frequency range too large.');
end
if (freq_pts<1)
  error('Requested frequency range too narrow.');
end

f_max=f(freq_pts,1);
plot(f(1:freq_pts,1),f(1:freq_pts,7),'k-');
axis([0,freq,0,1]);
xlabel('Frequency (Hz)')
if (nargin>3)
  title(label);
else
 title(['Ch Hist: ',cl.what]);
end  