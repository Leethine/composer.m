function sout=gensound(notation, duration, fs=44100, speed=0.5, 
                       power=1, instrument='default', style='latine')
% @ notation: the notation of the sound (e.g. "Do1" "La3")
% @ duration: the duration of the sound (e.g. 1/2 3/4)
% @ fs: sampling frequency, by default 44100
% @ speed: the playing speed, by default 0.5s for an 1/4 note
% @ instrument: for now only default is supported
% @ style: the notation style, by default latine (also: "english")

% Returns the sound vector of the corresponding properties
% 
                
  if strcmp(notation, "Silence")
    t = makenote(duration, fs, speed);
    sout = zeros(size(t));
  
  else
    t = makenote(duration, fs, speed);
    n = notation2key(notation, style);
    freq = keyfreq(n);
  
    if strcmp(instrument, "default")
      sout = power * gensound_canon(t, freq);
    endif
  endif
  
endfunction
