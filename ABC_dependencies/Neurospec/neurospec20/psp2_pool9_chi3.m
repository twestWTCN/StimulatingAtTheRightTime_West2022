function psp2_pool9_chi3(f,t,cl,freq,lag_tot,lag_neg,ch_max,chi_max,label)
% psp2_pool9_chi3(f,t,cl,freq,lag_tot,lag_neg,ch_max,chi_max,label)
% function to plot output of 2 channel pooled spectral analysis, includes 3 chi-squared tests.
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
%    Contact:  contact@neurospec.org
%  
% f,t,cl   Ouput from pooled spectral analysis routine pool_scf_out.
% freq     Frequency limit for plotting (Hz).
% lag_tot  Total lag range for time domain including -ve lags (ms).
% lag_neg  Negative lag range (ms).    
% ch_max   Upper limit for coherence estimte.
% chi_max  Upper limit for chi^2 difference of spectra & difference of coherence test.
% label    Label for subplots, used in preference to cl.what
%
% This 9 plot version, includes 3 chi-squared tests and time domain plot.
%
% psp2_pool9_chi3(f,t,cl,freq,lag_tot,lag_neg,ch_max,chi_max,label)


if (nargin<8)
  error('Not enough input arguments')
end  
% Check this is output from pool_scf_out.m
if (isfield(cl,'pl_fil_tot')==0)
  error('Results not generated by pool_scf_out.m')
end

if (nargin<9)
  % fa input spectrum.
  subplot(5,2,1)
  psp_fa1(f,cl,freq)
  % fb output spectrum.
  subplot(5,2,2)
  psp_fb1(f,cl,freq)
  % fa chi^2 test, in column 9 of f.
  subplot(5,2,3)
  psp_fchia1(f,cl,freq,chi_max)
  % fb chi^2 test, in column 10 of f.
  subplot(5,2,4)
  psp_fchib1(f,cl,freq,chi_max)
  % Pooled (r) coherence, in column 4 of f.
  subplot(5,2,5)
  psp_ch1(f,cl,freq,ch_max)
  % Coherence histogram, in column 7 of f.
  subplot(5,2,6)
  psp_chst1(f,cl,freq)
  % coh chi^2 test, in column 8 of f.
  subplot(5,2,7)
  psp_chi1(f,cl,freq,chi_max)
  % Pooled Phase
  subplot(5,2,8)
  psp_ph1(f,cl,freq)
  % Pooled cumulant
  subplot(5,2,9)
  psp_q1(t,cl,lag_tot,lag_neg)
else
  % fa input spectrum.
  subplot(5,2,1)
  psp_fa1(f,cl,freq,label)
  % fb output spectrum.
  subplot(5,2,2)
  psp_fb1(f,cl,freq,label)
  % fa chi^2 test, in column 9 of f.
  subplot(5,2,3)
  psp_fchia1(f,cl,freq,chi_max,label)
  % fb chi^2 test, in column 10 of f.
  subplot(5,2,4)
  psp_fchib1(f,cl,freq,chi_max,label)
  % Pooled (r) coherence, in column 4 of f.
  subplot(5,2,5)
  psp_ch1(f,cl,freq,ch_max,label)
  % Coherence histogram, in column 7 of f.
  subplot(5,2,6)
  psp_chst1(f,cl,freq,label)
  % coh chi^2 test, in column 8 of f.
  subplot(5,2,7)
  psp_chi1(f,cl,freq,chi_max,label)
  % Pooled Phase
  subplot(5,2,8)
  psp_ph1(f,cl,freq,label)
  % Pooled cumulant
  subplot(5,2,9)
  psp_q1(t,cl,lag_tot,lag_neg,label)
end
