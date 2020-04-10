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
## @deftypefn {Function File} {@var{rat} =} str2rat(@var{ratstr})
##
## @var{ratstr}: rational number in string format
##
## Returns the rational number as number.
## @end deftypefn

function rat=str2rat(ratstr)
  if (nargin != 1)
    print_usage ();
  endif

  if isnan(str2double(ratstr))
    r = strsplit(ratstr, '/');
    rat= str2double(r(1){1,1}) / str2double(r(2){1,1});
  else
    rat = str2double(ratstr);
  endif
  
endfunction
