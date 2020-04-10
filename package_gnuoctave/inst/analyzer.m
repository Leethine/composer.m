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
## @deftypefn {Function File} {[@var{F},@var{AMP},@var{PH}] =} analyzer (@var{y}, @var{fs}, @var{dt})
##
## Analyze the compositions of the music instrument
##
## @var{y}:  the input sample soundwave
##
## @var{fs}: sampling frequency
##
## @var{dt}: period of sampling in seconds
##
## Returns [@var{f},@var{Amp},@var{ph}], i.e. the Frequencies, AMPlitudes and PHases  
## which are themselves cell array that contains a list of vectors.
## The size of the cell structure depends on @var{dt}, the sampling period.
## @end deftypefn

function [F,AMP,PH]=analyzer(y,fs,dt)
  if ( nargin != 3 )
    print_usage ();
  endif
  
  F = cell();
  AMP = cell();
  PH = cell();
  
  % start positions of each piece
  pos = [1:floor(fs*dt):length(y)];
  for n = 1:length(pos)-1
    % cut out a piece of signal
    v = y(pos(n):pos(n+1));
    [Amp, Phi, f] = fourier(v,fs,true);
    AMP(n) = Amp;
    PH(n)  = Phi;
    F(n)   = f;
  endfor
  
endfunction
