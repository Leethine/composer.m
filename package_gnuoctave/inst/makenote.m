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
## @deftypefn {Function File} {@var{t} =} makenote(@var{notelen}, @var{fs}, @var{tempo})
##
## Generate a sinusoidal sound wave.
##
## @var{notelen}: the note length according to the note name (e.g. 1/4 1/8 ...)
##
## @var{fs}: sampling frequency, by default 44100
##
## @var{tempo}: the speed of a 1/4 note, by default 0.5s
##
## Returns @var{t} the time sequence array of the note.
## 
## @end deftypefn

function t=makenote(notelen, fs=44100, tempo=0.5)
  if (nargin < 1 || nargin > 3)
    print_usage ();
  endif

  dt = 1/fs;
  T64 = tempo/16;
  t64 = [0:dt:T64];
  [temp k] = size(t64);
  
  notelenref = [1, 1/2, 1/4, 3/4, 1/8, 3/8, 5/8, 7/8, 
                1/16, 3/16, 5/16, 7/16, 9/16, 11/16, 13/16, 15/16,
                1/32, 3/32, 5/32, 7/32, 9/32, 11/32, 13/32, 15/32, 
                17/32, 19/32, 21/32, 23/32, 25/32, 27/32, 29/32, 31/32,
                1/64, 3/64, 5/64, 7/64, 9/64, 11/64, 13/64, 15/64,
                17/64, 19/64, 21/64, 23/64, 25/64, 27/64, 29/64, 31/64,
                33/64, 35/64, 37/64, 39/64, 41/64, 43/64, 45/64, 47/64,
                49/64, 51/64, 53/64, 55/64, 57/64, 59/64, 61/64, 63/64
               ];
  
  notelenindex = [64 32 16 48 8 24 40 56
                  4 12 20 28 36 44 52 60
                  2 6 10 14 18 22 26 30
                  34 38 42 46 50 54 58 62
                  1 3 5 7 9 11 13 15
                  17 19 21 23 25 27 29 31
                  33 35 37 39 41 43 45 47
                  49 51 53 55 57 59 61 63
                  ];
                  
  idx = find(notelenref==notelen);
  n64 = notelenindex(idx); % number of 1/32 length
  
  % generate t
  t = linspace(0,n64*T64,n64*k);
  
endfunction

