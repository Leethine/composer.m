function sheet=parse(fname)
% @fname: filename  
% Returns the sheet structure

  fid = fopen (fname, "r");
  txt = textscan(fid,"%s");
  fclose (fid);
  txt = txt{1,1};
  sheet = struct();
  
  % get headers
  for idx = [1:size(txt)(1)]
    l = txt(idx){1,1};
    if l(1) == '@'
      if strcmp(l, "@fs")
        fs = str2double(txt(idx+1){1,1});
      elseif strcmp(l, "@tempo")
        tempo = str2double(txt(idx+1){1,1});
      elseif strcmp(l, "@nclefs")
        nclefs = str2double(txt(idx+1){1,1});
      endif
    endif
  endfor

  sheet.fs = fs;
  sheet.tempo = tempo;
  sheet.nclefs = nclefs;
  
  %get clif name
  clefname = {};
  for idx = [1:size(txt)(1)]
    l = txt(idx){1,1};
    if length(l) > 1 && strcmp(l(1:2),'||')
      clefname(end+1) = l(3:end-1);
    endif
  endfor
  
  % get for each clef the music score 
  for clef = clefname
    c = {};
    % for each row(line) of the text
    for idx = [1:size(txt)(1)] 
      l = txt(idx){1,1};
      % if the line begins with "||clef..."
      if length(l) > 1 && strcmp(l(1:2),'||') && strcmp(l(3:end-1),clef)
        % traverse the rest of the lines for all the scores of this clef
        for idx2 = [idx+1:size(txt)(1)]
          l2 = txt(idx2){1,1};
          if length(l2) > 1 && strcmp(l2(1:2),'||')
            % stop until the next clef
            break
          endif
          if length(l2) > 2 && l2(1) == '(' && l2(end) == ')'
            c{end+1} = l2;
          endif
        endfor
      endif
    endfor
    
    % store the clef's score
    sheet.(clef{1,1}) = c;
    
  endfor

endfunction
