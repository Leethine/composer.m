function rat=str2ratio(ratstr)
% @ratiostr: rational number as string
% Returns the tuple of string elements

  if isnan(str2double(ratstr))
    r = strsplit(ratstr, '/');
    rat= str2double(r(1){1,1}) / str2double(r(2){1,1});
  else
    rat = str2double(ratstr);
  endif
  
endfunction
