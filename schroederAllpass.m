function [reverbedSound] = schroederAllpass(signalForReverb, reverbLength, reverbGain, Fs)

b = zeroes(1, reverbLength + 1);
b(1) = -reverbGain;
b(reverbLength + 1) = 1;

a = zeroes(1, reverbLength + 1);
a(1) = 1;
a(reverbLength + 1) = -reverbGain;

reverbedSound = filter(b, a, signalForReverb);

end