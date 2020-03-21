# composer.m
Composing classical music with GNU Octave or Matlab

**Version 0.0.1**

Usage:

```matlab
octave1> cd $./functions
octave2> sheet = parse("PATH_OF_YOUR_MUSIC_SCRIPT.cm"); % parse the script into a cell structure called sheet
octave3> v = mix(compose(sheet));                       % "compile" the sheet to soundwave
octave4> sound(v,sheet.fs)                              % play the soundwave
```

For demonstration, I have created a sample music script `scripts/habanera.cm`.
