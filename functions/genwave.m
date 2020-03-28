function y=genwave(t, flist, amplist, phlist, ratio=0.9)
% Generate sound wave from frequencies
% @t: time array (can be obtained by makenote())
% @flist:   frequencies in a list
% @amplist: corresponding amplitudes in a list
% @phlist:  corresponding phases in a list
% @ratio: the ratio of recovery
  
  if (length(flist)  != length(amplist) || 
     length(phlist) != length(amplist) ||
     length(flist)  != length(phlist) )
     disp('Warning: input dimention mismatch');
     return
   endif
   
   % set the amplitude threshold
   th = (1 - ratio) * max(amplist);   
   % save time for for loop 
   % loop until n-th element
   N = length(nonzeros(amplist > th));
   y = zeros(1,length(t));
   for n = 1:N
     y = y + amplist(n) * sin(2*pi*flist(n)*t + phlist(n));
   endfor

endfunction
