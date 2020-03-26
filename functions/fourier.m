function [Amp, Phi,f]=fourier(y, fs, sorted=false)
% Takes the fourier transform of y for every dt samples
% @y: the signal
% @N: n-point DFT

  n = length(y); % number of samples
  m = pow2(nextpow2(n));
  %t = [1:n] / fs;
  
  Y = fft(y);
  
  % get the one-sided frequency from asymetric frequencies
  Y = 2 * Y(1:n/2+1);
  
  % Get frequency range
  f = [0:(n/2)]* fs/n;
  % the new length
  
  % Get amplitude and phase
  Phi = atan2(imag(Y), real(Y));
  Amp = abs(Y);
  
  if sorted == true
     [Amp, sortedIndex] = sort(Amp, 'descend');
     f = f(sortedIndex);
     Phi = Phi(sortedIndex);
  endif
  
endfunction
