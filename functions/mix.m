function v=mix(voices)
% @voices: the Cell structure returned by Compose()
% Mix the voices and returns the mixed music soundwave
    v = zeros(size(voices(1){1,1}));
    
    for part = voices
        v = v + part{1,1};
    endfor
    
    v = v/max(v);
    
endfunction
