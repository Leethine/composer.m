function sout=gensound_canon(t, freq)
% Inspired by an anonymous matlab Canon code on the internet

% @ t: time-duration vector
% @ freq: frequency of the sound generated
% Generate the sound of freq and t-duration
% default style

  mod = sin(pi*t/t(end));
  sout = mod.*cos(2*pi*freq*t);

endfunction

