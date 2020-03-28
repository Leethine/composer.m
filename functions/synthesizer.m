function y=synthesizer(t, c, ratio=0.9)
% Synthesize the amplitudes, phases, freqs...
% stored in the cell c
% @t: the time vector
% @c: cell structure that contains everything
% c{i,1} Amplitudes, c{i,2} Phases, c{i,3} Freq
  
  nrow = size(c)(1);
  y = zeros(1,length(t));
  
  for idx = 1:nrow
    Amp  = c{idx,1};
    Phi  = c{idx,2};
    freq = c{idx,3};
    y = y + genwave(t,freq,Amp,Phi,ratio);
  endfor
    
    y = y / max(y);
    
endfunction
