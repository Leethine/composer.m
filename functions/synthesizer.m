function y=synthesizer(dt, c, fs, ratio=0.9)
% Synthesize the amplitudes, phases, freqs...
% stored in the cell c
% @dt: the sampling interval
% @c: cell structure that contains everything
% c{i,1} Amplitudes, c{i,2} Phases, c{i,3} Freq
  
  nrow = size(c)(1);
  tcell = cell();
  %floor(fs*dt)/(fs*dt);
  t = [0:1/fs:nrow*dt];
  L = floor(length(t)/nrow);
  
  for n = 1:nrow
    tcell(n) = t( (n-1)*L+1 : n*L );
  endfor
  
  %y = zeros(1,length(t));
  y = [];
  for idx = 1:nrow
    Amp  = c{idx,1};
    Phi  = c{idx,2};
    freq = c{idx,3};
    %y = y + genwave(t,freq,Amp,Phi,ratio);
    v = genwave(tcell(idx){1,1},freq,Amp,Phi,ratio);
    y = [y v];
  endfor
    
    y = y / max(y);
    
endfunction
