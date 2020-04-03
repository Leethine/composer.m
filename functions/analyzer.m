function c=analyzer(y,fs,dt=0.001)
% Analyze the compositions of the music instrument
% @y:  input soundwave
% @fs: sampling frequency
% @dt: period of sampling
% Returns a cell type structure whose rows are {Amp, Phi, f}

  c = cell();
  % start positions of each piece
  pos = [1:floor(fs*dt):length(y)];
  for n = 1:length(pos)-1
    % cut out a piece of signal
    v = y(pos(n):pos(n+1));
    [Amp, Phi, f] = fourier(v,fs,true);
    c{n,1} = Amp;
    c{n,2} = Phi;
    c{n,3} = f;
  endfor
  
endfunction
