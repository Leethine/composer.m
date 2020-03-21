% Generate wav sound from the music script

function voices=compose(sheet)
% @sheet: the sheet structure we get from Parse()
% Returns the soundwave, which is a Cell who contains all clefs

    fs = sheet.fs;
    tempo = sheet.tempo;
    nclefs = sheet.nclefs;
    
    voices = cell();
    for idx = [1:nclefs]
        clefname = strcat('clef',sprintf('%d',idx));
        v1 = [];
        for s = sheet.(clefname)
          tp = str2tuple(s{1,1});
          note  = tp(1){1,1};
          duree = str2ratio(tp(2){1,1});
          v = gensound(note, duree, fs, tempo);
          v1 = [v1 v];
        endfor
        voices(idx) = v1;
    endfor

endfunction
