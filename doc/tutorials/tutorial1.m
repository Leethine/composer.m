% A quick guide of composer.m
% Tutorial 1: generating basic sound

% sampling frequency
fs = 44100;

% make a time sequence array
sec = 1;     % one second
dt = 1 / fs; % time increment
t = [0:dt:sec]; % the time sequence

% generate the wave according to y = sin(2πft)
% let's use f = 440, the middle "la", or A4
f = 440;
y = sin(2*pi*f*t);

sound(y,fs);

% plot the sound wave
plot(y)

% it's ugly, so now we modify a bit.
t2 = linspace(0,0.5,length(t));
mod = sin(2*pi*t2);
y_mod = mod .* y;
sound(y_mod,fs);

% plot the sound wave
plot(y_mod)

% Alternatively we can use other modification functions
% such as quadratic
t3 = linspace(0,2,length(t));
mod2 = - (t3 - 1).^2 + 1;
y_mod2 = mod2 .* y;
sound(y_mod2,fs);

