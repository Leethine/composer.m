% Compose script for Habanera of Carmen, by Georges Bizet %

cd ../functions

fname = "../scripts/habanera.cm";
sheet = parse(fname);
fs = sheet.fs;
speed = sheet.speed;
nclefs = sheet.nclefs;

v1 = [];
for s = sheet.clef1
  tp = str2tuple(s{1,1});
  note  = tp(1){1,1};
  duree = str2ratio(tp(2){1,1});
  v = gensound(note, duree, fs, speed);
  v1 = [v1 v];
endfor

v2 = [];
for s = sheet.clef2
  tp = str2tuple(s{1,1});
  note  = tp(1){1,1};
  duree = str2ratio(tp(2){1,1});
  v = gensound(note, duree, fs, speed);
  v2 = [v2 v];
endfor

v3 = [];
for s = sheet.clef3
  tp = str2tuple(s{1,1});
  note  = tp(1){1,1};
  duree = str2ratio(tp(2){1,1});
  v = gensound(note, duree, fs, speed);
  v3 = [v3 v];
endfor

v4 = [];
for s = sheet.clef4
  tp = str2tuple(s{1,1});
  note  = tp(1){1,1};
  duree = str2ratio(tp(2){1,1});
  v = gensound(note, duree, fs, speed);
  v4 = [v4 v];
endfor

v = v1 + v2 + v3 + v4;
v = v/max(v);

