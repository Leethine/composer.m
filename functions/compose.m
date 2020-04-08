function voices=compose(sheet)
% Generate wav sound from the music script
% @sheet: the sheet structure we get from Parse()
% Returns the soundwave, which is a Cell who contains all clefs
    instype = 'default'; % test
    
    fs = sheet.fs;
    tempo = sheet.tempo;
    nclefs = sheet.nclefs;
    
    voices = cell();
    for idx = [1:nclefs]
        % get the clefname
        clefname = strcat('clef',sprintf('%d',idx));
        v1 = [];
        % traverse the scores for each clef
        for s = sheet.(clefname)
          
          % if a chord is encountered, (Note,period)+(Note)+(Note) ...
          if strfind(s{1,1},'+')
            c = strsplit(s{1,1},'+'); % a cell of pitches
            tp = str2tuple(c(1){1,1});
            note = tp(1){1,1};
            % the duration doesn't change
            duree = str2ratio(tp(2){1,1}); 
            %v = (1/length(c)) * gensound(note, duree, fs, tempo);
            v = gensound(note, duree, fs, tempo, instype);
            for othernote = c(2:end)
              % othernote has the form '(Note)'
              note = othernote{1,1}(2:end-1);
              %v = v + (1/length(c)) * gensound(note, duree, fs, tempo);
              v = v + gensound(note, duree, fs, tempo, instype);
            endfor
            
          else
            % if the pitch has a single note
            tp = str2tuple(s{1,1});
            note  = tp(1){1,1};
            duree = str2ratio(tp(2){1,1});
            v = gensound(note, duree, fs, tempo, instype);
          endif
          % accumulate
          v1 = [v1 v];
        endfor
        % save the soundwave of this clef into cell
        voices(idx) = v1;
    endfor

endfunction
