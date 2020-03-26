function freq=keyfreq(n)
% @ n : the n-th key (can be scalar or vector, n=1~88)
% Return the frequency of the nth key on a standardised piano
  freq = ( 2 .^ ( (n - 49) ./ 12) ) * 440; 
  
endfunction
