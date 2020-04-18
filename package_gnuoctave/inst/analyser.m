## Copyright (C) 2020 Zian Li <zian.li.1996@outlook.com>
##
## This program is free software; you can redistribute it and/or
## modify it under the terms of the GNU General Public License as
## published by the Free Software Foundation; either version 3 of the
## License, or (at your option) any later version.
##
## This program is distributed in the hope that it will be useful, but
## WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
## General Public License for more details.
##
## You should have received a copy of the GNU General Public License
## along with this program; if not, see
## <http:##www.gnu.org/licenses/>.

## -*- texinfo -*-
## @deftypefn {Function File} {[@var{Freq},@var{Amp}] =} analyser 
## (@var{ff}, @var{ratio}, @var{tol}, @var{F}, @var{A})
##
## Harmonic analysis of the music instrument
##
## @var{ff}:  the fundamental frequency
##
## @var{ratio}: restoration ratio (e.g. 0.9)
##
## @var{tol}: frequency imprecision tolerance ratio (e.g. 0.1)
##
## @var{F}: Frequency array obtained by fourier analysis
##
## @var{A}: Amplitude array obtained by fourier analysis
##
## Returns [@var{Freq},@var{Amp}], i.e. the FREQuencies and AMPlitudes of the 
## principal harmonics.
##
## @end deftypefn

function [Freq, Amp] = analyser(ff, ratio, tol, F, A)
  if ( nargin != 5 )
    print_usage ();
  endif

  % select only useful part
  FR = ( A > (1-ratio)*A(1) ) .* F;
  AM = ( A > (1-ratio)*A(1) ) .* A;
  
  % init output array
  Freq = [];
  Amp  = [];
  
  % search for harmonies
  for n = [1:12]
    % frequancy inprecision tolerance
    tolerance = n * ff * tol;
    minfreq = n * ff - tolerance;
    maxfreq = n * ff + tolerance;
    
    arrayidx = FR > minfreq & FR < maxfreq;
    
    Freq(n) = n * ff;
    Amp(n)  = sum( AM.*arrayidx );

  endfor
  
  % normalise Amp to percentage
  Amp = 100 * Amp / sum(Amp);
  
endfunction
