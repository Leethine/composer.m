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
## @deftypefn {Function File} {@var{y} =} genwave(@var{t},@var{flist},@var{amplist},@var{phlist},@var{ratio})
##
## Generate sound wave from frequency list.
##
## @var{t}: the time sequence array
##
## @var{flist}: frequency list
##
## @var{amplist}: amplitude list
##
## @var{phlist}: list of phases
##
## @var{ratio}: ratio of restoration, by default 90%
##
## Returns @var{y} the reconstructed sinusoidal sound wave.
## 
## @end deftypefn

function y=genwave(t, flist, amplist, phlist, ratio=0.9)
  if (nargin != 4 && nargin != 5)
    print_usage ();
  endif
  
  if (length(flist)  != length(amplist) || 
      length(phlist) != length(amplist) ||
      length(flist)  != length(phlist) )
     disp('Warning: input dimention mismatch');
     return
   endif
   
   % set the amplitude threshold
   th = (1 - ratio) * max(amplist);   
   % save time for for loop 
   % loop until n-th element
   N = length(nonzeros(amplist > th));
   y = zeros(1,length(t));
   for n = 1:N
     y = y + amplist(n) * sin(2*pi*flist(n)*t + phlist(n));
   endfor
   
   y = y / max(y);
   
endfunction
