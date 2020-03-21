function sout=gensound_canon(t, freq)
% @ t: time-duration vector
% @ freq: frequency of the sound generated
% Generate the sound of freq and t-duration
% default style canon

  mod = sin(pi*t/t(end));
  sout = mod.*cos(2*pi*freq*t);
endfunction

