function tp=str2tuple(s)
% @s: a tuple as string
% Returns a tuple of notations (actually a cell of strings)

  new_s = '';
  
  % clean the string
  for c = s
    if c == '(' || c == ')' || c == ' '
    else
       new_s = strcat(new_s, c);
    endif
  endfor
  
  tp = strsplit(new_s, ',');

endfunction
