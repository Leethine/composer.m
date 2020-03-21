function t=makenote(notelen, fs=44100, tempo=0.5)
% @ notelen: length according to note symbol (e.g. 1/4 1/8 ...)
% @ fs: sampling frequency
% @ tempo: the speed of an 1/4 note played
% Return the time-duration vector of the note

  dt = 1/fs;
  T32 = tempo/8;
  t32 = [0:dt:T32];
  [temp k] = size(t32);
  
  notelenref = [1 1/2 1/4 3/4 1/8 3/8 5/8 7/8 
                1/16 3/16 5/16 7/16 9/16 11/16 13/16 15/16
                1/32 3/32 5/32 7/32 9/32 11/32 13/32 15/32 
                17/32 19/32 21/32 23/32 25/32 27/32 29/32 31/32
               ];
  
  notelenindex = [32 16 8 24 4 12 20 28
                  2 6 10 14 18 22 26 30
                  1 3 5 7 9 11 13 15
                  17 19 21 23 25 27 29 31
                  ];
                  
  idx = find(notelenref==notelen);
  n32 = notelenindex(idx); % number of 1/32 length
  
  % generate t
  t = linspace(0,n32*T32,n32*k);
  % Or use row vector instead
  %t = transpose(linspace(0,n16*T16,n16*k));
  
endfunction

