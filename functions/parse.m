function sheet=parse(fname)
% @fname: filename  
% Returns the sheet structure

  fid = fopen (fname, "r");
  text = textscan(fid,"%s");
  fclose (fid);
  text = text{1,1};
  sheet = struct();
  
  % get headers
  for idx = [1:size(text)(1)]
    line = text(idx){1,1};
    if line(1) == '@'
      if strcmp(line, "@fs")
        fs = str2double(text(idx+1){1,1});
      elseif strcmp(line, "@speed")
        speed = str2double(text(idx+1){1,1});
      elseif strcmp(line, "@nclefs")
        nclefs = str2double(text(idx+1){1,1});
      endif
    endif
  endfor

  sheet.fs = fs;
  sheet.speed = speed;
  sheet.nclefs = nclefs;
  
  %get clif name
  clefname = {};
  for idx = [1:size(text)(1)]
    line = text(idx){1,1};
    if length(line) > 1 && strcmp(line(1:2),'||')
      clefname(end+1) = line(3:end-1);
    endif
  endfor

  for clef = clefname
    c = {};
    for idx = [1:size(text)(1)]
      line = text(idx){1,1};
      if length(line) > 1 && strcmp(line(1:2),'||') && strcmp(line(3:end-1),clef)
        for idx2 = [idx+1:size(text)(1)]
          line2 = text(idx2){1,1};
          if length(line2) > 1 && strcmp(line2(1:2),'||')
            break
          endif
          if line2(1) == '(' && line2(end) == ')'
            c{end+1} = line2;
          endif
        endfor
      endif
    endfor
    sheet.(clef{1,1}) = c;
  endfor

endfunction