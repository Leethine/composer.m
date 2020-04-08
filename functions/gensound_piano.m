function y = gensound_piano(t,fs,freq,s=4)
  
  tm = [0:1/fs:s];
  x = linspace(0,s,length(tm));
  coef = 4 * fs / length(x) ;
  mod = e.^(-x*coef);
  
  n = round(fs/100);
  m = round(0.66 * n);
  
  mod1 = zeros(1,n);
  mod1(1:m) = linspace(0, 1, m);
  mod1(m:n) = linspace(1, mod(n), n-m+1);
  %mod1 = 1.4 * (mod1 > 1.4) + mod1;
  
  mod(1:n) = mod1;
  lt = length(t);
  lm = length(mod);
  
  y = 10 * sin(2*pi*t*freq) + 8 * sin(2*pi*t*2*freq);
  y = y + 2 * sin(2*pi*t*3*freq) + 2 * sin(2*pi*t*4*freq);
  y = y + 1 * sin(2*pi*t*6*freq) + 1 * sin(2*pi*t*7*freq);
  
  if lt > length(tm)
    y(1:lm) = mod .* y(1:lm);
    y(lm:end) = 0;
  elseif lt < length(tm)
    y = mod(1:lt) .* y;
  else
    y = mod .* y;
  endif
  
endfunction
