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
## @deftypefn {Function File} {[@var{Amp},@var{Phi},@var{F}] =} fourier(@var{y},@var{fs},@var{sorted})
##
## Computes the fourier transform of a sound sample y.
##
## @var{y}: the sound array
##
## @var{fs}: the sampling frequency
##
## @var{sorted}: the array being sorted according to the frequency (by default @var{sorted}=true)
##
## Returns @var{f} the frequency array, @var{Amp} the amplitudes array
## and @var{Phi} the phases array.
## 
## @end deftypefn

function [Amp, Phi,f]=fourier(y, fs, sorted=true)
  
  if (nargin != 2 && nargin != 3)
    print_usage ();
  endif

  n = length(y); % number of samples
  m = pow2(nextpow2(n));
  %t = [1:n] / fs;
  
  Y = fft(y);
  
  % get the one-sided frequency from asymetric frequencies
  Y = 2 * Y(1:n/2+1);
  
  % Get frequency range
  f = [0:(n/2)]* fs/n;
  % the new length
  
  % Get amplitude and phase
  Phi = atan2(imag(Y), real(Y));
  Amp = abs(Y);
  
  if sorted == true
     [Amp, sortedIndex] = sort(Amp, 'descend');
     f = f(sortedIndex);
     Phi = Phi(sortedIndex);
  endif
  
endfunction
