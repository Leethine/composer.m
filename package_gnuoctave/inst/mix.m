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
## @deftypefn {Function File} {@var{v} =} mix(@var{voices})
##
## Mix the voices and returns the mixed music soundwave.
##
## @var{voices}: a cell structure that contains multiple channels of soundwave
##
## Returns @var{y} the soundwave array which can be played directly.
## 
## @end deftypefn

function y=mix(voices)

  if (nargin != 1) 
    print_usage ();
  endif
  
  for part = voices
  v = zeros(size(voices(1){1,1}));
    v = v + part{1,1};
  endfor
    
  v = v/max(v);
    
endfunction
