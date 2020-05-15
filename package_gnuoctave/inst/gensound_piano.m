function y = gensound_piano(t,fs,N)
  
  freq = keyfreq(N);
  
  %mu = log(freq);
  mu = 2 * sqrt(freq)/10;
  lambda = 0.8 * log(freq);
  
  A1 = 60 * e.^(-mu*t * log(1*freq)/8 );
  A2 = 8  * e.^(-mu*t * log(2*freq)/8 );
  A3 = 6  * e.^(-mu*t * log(3*freq)/8 );
  A4 = 4  * e.^(-mu*t * log(4*freq)/8 );
  A5 = 2  * e.^(-mu*t * log(5*freq)/8 );
  A6 = 1  * e.^(-mu*t * log(6*freq)/8 );
  A7 = 2  * e.^(-mu*t * log(7*freq)/8 );
  
  y1 = A1 .* sin(2*pi*t*freq);
  y2 = A2 .* sin(2*pi*t*2*freq);
  y3 = A3 .* sin(2*pi*t*3*freq);
  y4 = A4 .* sin(2*pi*t*4*freq);
  y5 = A5 .* sin(2*pi*t*6*freq);
  y6 = A6 .* sin(2*pi*t*7*freq);
  y7 = A7 .* sin(2*pi*t*7*freq);
  
  y = y1 + y2 + y3 + y4 + y5 + y6 + y7;
  
  hittime = 0.01;
  t0 = [0:1/fs:hittime];
  n0 = length(t0);
  hit = zeros(size(t));
  %hitforce = 2 * (A1(1) + A2(1) + A3(1) + A4(1) + A5(1) + A6(1) + A7(1));
  
  x = [1:n0];
  hit(1:n0) = x .* (n0 - x) / n0;
  %hit(1:n0) = hitforce + ( (y(n0) - hitforce ) / n0 ) * x;
  hit = hit .* (hit > 0);
  y = y + hit;

  y = y / max(y);
  
endfunction
