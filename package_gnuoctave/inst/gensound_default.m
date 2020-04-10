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
## @deftypefn {Function File} {@var{sout} =} gensound_default(@var{t},@var{freq})
##
## Generate a sinusoidal sound wave.
##
## @var{t}: time sequence array
##
## @var{freq}: frequency
##
## Returns @var{sout} the simplest sinusoidal sound wave as an array.
## 
## @end deftypefn

function sout=gensound_default(t, freq)
  
  if (nargin != 2)
    print_usage ();
  endif
  mod = sin(pi*t/t(end));
  sout = mod.*cos(2*pi*freq*t);

endfunction
