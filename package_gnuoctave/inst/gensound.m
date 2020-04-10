function sout=gensound(notation, duration, fs=44100, tempo=0.5, 
                       instrument='default', strength=1, style='latine')
% @ notation: the notation of the sound (e.g. "Do1" "La3")
% @ duration: the duration of the sound (e.g. 1/2 3/4)
% @ fs: sampling frequency, by default 44100
% @ tempo: the playing speed, by default 0.5s for an 1/4 note
% @ strength: defines how strong one wants to play the note
% @ instrument: for now only default is supported
% @ style: the notation style, by default latine (also: "english")

% Returns the sound vector of the corresponding properties
% 

  if strcmp(notation, "Silence")
    t = makenote(duration, fs, tempo);
    sout = zeros(size(t));
  
  else
    t = makenote(duration, fs, tempo);
    n = notation2key(notation, style);
    freq = keyfreq(n);
  
    if strcmp(instrument, "default")
      sout = strength * gensound_canon(t, freq);
    elseif strcmp(instrument, "piano")
      sout = strength * gensound_piano(t,fs,freq,1.2);
      % trim the sound to reduce sharp noises
      ntrim = floor(length(t)/500);
      sout(end-ntrim:end) = 0;
    endif
  endif
  
endfunction
