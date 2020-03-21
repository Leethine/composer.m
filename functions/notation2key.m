function n=notation2key(notation, style='latine')
% @ notation: the notation as str
% @ style: the style of the notation, by default latin
% Returns the number of key corresponding to the notation

  % latin style reference index
  latinstyleref = [
   "Do7"; 
   "Si6"; "La6#"; "La6"; "Sol6#"; "Sol6"; "Fa6#"; 
   "Fa6"; "Mi6"; "Re6#"; "Re6"; "Do6#"; "Do6";
   "Si5"; "La5#"; "La5"; "Sol5#"; "Sol5"; "Fa5#"; 
   "Fa5"; "Mi5"; "Re5#"; "Re5"; "Do5#"; "Do5";
   "Si4"; "La4#"; "La4"; "Sol4#"; "Sol4"; "Fa4#"; 
   "Fa4"; "Mi4"; "Re4#"; "Re4"; "Do4#"; "Do4";
   "Si3"; "La3#"; "La3"; "Sol3#"; "Sol3"; "Fa3#";
   "Fa3"; "Mi3"; "Re3#"; "Re3"; "Do3#"; "Do3";
   "Si2"; "La2#"; "La2"; "Sol2#"; "Sol2"; "Fa2#"; 
   "Fa2"; "Mi2"; "Re2#"; "Re2"; "Do2#"; "Do2";
   "Si1"; "La1#"; "La1"; "Sol1#"; "Sol1"; "Fa1#"; 
   "Fa1"; "Mi1"; "Re1#"; "Re1"; "Do1#"; "Do1";
   "Si-1"; "La-1#"; "La-1"; "Sol-1#"; "Sol-1"; "Fa-1#"; 
   "Fa-1"; "Mi-1"; "Re-1#"; "Re-1"; "Do-1#"; "Do-1";
   "Si0"; "La0#"; "La0"];
   
   % anglo-allemande style reference index
   englishstyleref = [
    "C8";
    "B7"; "A#7"; "A7"; "G#7"; "G7"; "F#7";
    "F7"; "E7"; "D#7"; "D7"; "C#7"; "C7";
    "B6"; "A#6"; "A6"; "G#6"; "G6"; "F#6";
    "F6"; "E6"; "D#6"; "D6"; "C#6"; "C6";
    "B5"; "A#5"; "A5"; "G#5"; "G5"; "F#5";
    "F5"; "E5"; "D#5"; "D5"; "C#5"; "C5";
    "B4"; "A#4"; "A4"; "G#4"; "G4"; "F#4";
    "F4"; "E4"; "D#4"; "D4"; "C#4"; "C4";
    "B3"; "A#3"; "A3"; "G#3"; "G3"; "F#3"; 
    "F3"; "E3"; "D#3"; "D3"; "C#3"; "C3";
    "B2"; "A#2"; "A2"; "G#2"; "G2"; "F#2"; 
    "F2"; "E2"; "D#2"; "D2"; "C#2"; "C2";
    "B1"; "A#1"; "A1"; "G#1"; "G1"; "F#1"; 
    "F1"; "E1"; "D#1"; "D1"; "C#1"; "C1";
    "B0"; "A#0"; "A0"];
    
  if strcmp(style,'latine')
      c = cellstr(latinstyleref);
  endif
  
  if strcmp(style,'english') || strcmp(style,'anglo-allemande')
      c = cellstr(englishstyleref);
  endif
  
  idx = find(strcmp(c,notation)==1);
  n = 89 - idx;
  
endfunction
