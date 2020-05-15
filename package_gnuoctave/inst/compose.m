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
## @deftypefn {Function File} {@var{v} =} compose (@var{sheet})
##
## Generate sound wave from the parsed music script
##
## @var{sheet}: the sheet cell structure obtained by parser function
##
## Returns the soundwave, which is a cell structure
## that contains the sounds from all clefs in ascending order.
## @end deftypefn

function voices=compose(sheet)

  if ( nargin != 1 )
    print_usage ();
  endif
  
  instype = 'recorder'; % test
  
  fs = sheet.fs;
  tempo = sheet.tempo;
  nclefs = sheet.nclefs;
  
  voices = cell();
  for idx = [1:nclefs]
      % get the clefname
      clefname = strcat('clef',sprintf('%d',idx));
      v1 = [];
      % traverse the scores for each clef
      for s = sheet.(clefname)
        
        % if a chord is encountered, (Note,period)+(Note)+(Note) ...
        if strfind(s{1,1},'+')
          c = strsplit(s{1,1},'+'); % a cell of pitches
          tp = str2tuple(c(1){1,1});
          note = tp(1){1,1};
          % the duration doesn't change
          duree = str2rat(tp(2){1,1}); 
          %v = (1/length(c)) * gensound(note, duree, fs, tempo);
          v = gensound(note, duree, fs, tempo, instype);
          for othernote = c(2:end)
            % othernote has the form '(Note)'
            note = othernote{1,1}(2:end-1);
            %v = v + (1/length(c)) * gensound(note, duree, fs, tempo);
            v = v + gensound(note, duree, fs, tempo, instype);
          endfor
            
        else
          % if the pitch has a single note
          tp = str2tuple(s{1,1});
          note  = tp(1){1,1};
          duree = str2rat(tp(2){1,1});
          v = gensound(note, duree, fs, tempo, instype);
        endif
        % accumulate
        v1 = [v1 v];
      endfor
      % save the soundwave of this clef into cell
      voices(idx) = v1;
  endfor

endfunction
