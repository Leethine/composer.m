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
## @deftypefn {Function File} {@var{tp} =} str2tuple(@var{s})
##
## @var{s}: tuple in string format
##
## Returns a tuple of notations, a cell struture of strings.
## @end deftypefn

function tp=str2tuple(s)
  if (nargin != 1)
    print_usage ();
  endif
  
  new_s = '';
  
  % clean the string
  for c = s
    if c == '(' || c == ')' || c == ' '
    else
       new_s = strcat(new_s, c);
    endif
  endfor
  
  tp = strsplit(new_s, ',');

endfunction
