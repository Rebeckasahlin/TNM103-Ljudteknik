s.boot;


(

SynthDef(\firstSynth, {
	var fas = 0.5;

	var output = SinOsc.ar(440, fas);

	FreqScope(400, 200, 0, server: s);

	Out.ar(0, {output}!2);
}
).play;
)

(

SynthDef(\thirdSynth, {
	var freq = 220;
	var width = 0.5;
	var tri = LFTri.ar(freq);            // Triangelvåg
	var saw = LFSaw.ar(freq)*0.5;            // Sågtandsvåg
	var pulse = LFPulse.ar(freq, 0, width);  // Pulsvåg
	FreqScope(400, 200, 0, server: s);

	Out.ar(0, {pulse}!2);
}
).play;
)

(

SynthDef(\secondSynth, {
	var fas = 1;

	var detune = 1;

	var sin1 = SinOsc.ar(220 + detune, fas) * 0.8;
	var sin2 = SinOsc.ar(220 - detune, fas) * 0.8;

	var output = sin1 + sin2;

	FreqScope(400, 200, 0, server: s);

	Out.ar(0, {output}!2);
}
).play;
)



(

SynthDef(\fourthSynth, {
	var fas = 1;

	var detune = 0;

	var sin1 = SinOsc.ar(329.63 + detune, fas);
	var sin2 = SinOsc.ar(220 - detune, fas);

	var sin3 = SinOsc.ar(220 * 2, fas) * 0.8;
	var sin4 = SinOsc.ar(220 * 1.5, fas) * 0.8;

	var output = sin2 + sin1;



	FreqScope(400, 200, 0, server: s);

	Out.ar(0, {output}!2);
}
).play;
)

(

SynthDef(\fifthSynth, {
	var fas = 1;


	var sin1 = SinOsc.ar(1, fas);
	var sin2 = SinOsc.ar(300 + sin1, fas);

	var output = sin2;

	FreqScope(400, 200, 0, server: s);

	Out.ar(0, {output}!2);
}
).play;
)

(
SynthDef(\sixthSynth, {
	var fas = 1;


	var sin1 = LFTri.ar(1, fas).range(-10, 10);
	var sin2 = SinOsc.ar(300 + sin1, fas);

	var output = sin2;

	FreqScope(400, 200, 0, server: s);

	Out.ar(0, {output}!2);
}
).play;
)

(
SynthDef(\seventhSynth, {
	var fas = 1;


	var sin1 = SinOsc.ar(1, fas).range(0, 1);
	var sin2 = SinOsc.ar(300, fas);

	var output = sin2*sin1;

	FreqScope(400, 200, 0, server: s);

	Out.ar(0, {output}!2);
}
).play;
)

(
SynthDef(\eightSynth, {
	var fas = 1;

	var pwm = SinOsc.ar(1, fas);//.range(0.5, 1);
	var pulse = LFPulse.ar(220, 0, pwm);

	var output = pulse;

	FreqScope(400, 200, 0, server: s);

	Out.ar(0, {output}!2);
}
).play;
)

(
SynthDef(\nineSynth, {
	var fas = 0.5;
	var v = 440;
	var u = 880;

	var sin1 = SinOsc.ar(u-v, fas);
	var sin2 = SinOsc.ar(u+v, fas);

	var output = 0.5*(sin1-sin2);

	FreqScope(400, 200, 0, server: s);

	Out.ar(0, {output}!2);
}
).play;
)

(
SynthDef(\tenSynth, {
	var fas = 1;
	var v = 329.63;
	var u = 880;

	var sin1 = SinOsc.ar(v, fas).range(0, 1);

	var sin2 = SinOsc.ar(u*sin1, fas);

	var output = sin2.scope;

	FreqScope(400, 200, 0, server: s);


	Out.ar(0, {output}!2);
}
).play;
)

(
SynthDef(\elevenSynth, {
	var fas = 1;

	var sin1 = SinOsc.ar(440).clip(-0.5, 0.5);

	var sin2 = SinOsc.ar(440).softclip;

	var output = sin1;

	FreqScope(400, 200, 0, server: s);


	Out.ar(0, {output}!2);
}
).play;
)





(
SynthDef(\twelveSynth, | input
	frequency = 200| {



}
).add;
)

~myFirst = Synth.new(\twelveSynth).register;




// LAB 4
(
SynthDef(\firstLab4, { | gate = 0, inputFreq = 440 |

	//var trigger = LFPulse.kr(1, 0, 0.5, 1, 0);
	var envelope = EnvGen.kr(Env.adsr(0.1, 0.3, 1.0, 1, -4.0), gate);
	var signal =  SinOsc.ar(inputFreq.midicps, 0, 0.1);


	var output = envelope * signal;

	Out.ar(0, {output}!2);
}
).add;
)




(
SynthDef(\firstSynth, { | inputFreq = 440 |
	var fas = 0.5;
	var output = SinOsc.ar(inputFreq.midicps, fas); // Använd inputFreq för att ändra frekvens
	Out.ar(0, [output, output]);
}).add;
)

~myfirstSynth = Synth.new(\firstLab4).register;


{
	var notes = [57, 60, 64, 69];
	loop {
		notes.do { |note|
			~myfirstSynth.set(\inputFreq, note); // Sätt tonen från listan
			~myfirstSynth.set(\gate, 1);
			0.5.wait;
			~myfirstSynth.set(\gate, 0);
			0.5.wait;
			~myfirstSynth.set(\gate, 1);
		};
	};
}.fork;


(
SynthDef(\noiseSynth, {| inputFreq = 440.00 |
	var noise = PinkNoise.ar(1, 0);
	// ------------------LowPass and HighPass
	//var low = LPF.ar(noise, inputFreq, 1, 0);
	//var high = HPF.ar(noise, inputFreq, 1, 0);

	// --------------- LFO
	//var lfo = SinOsc.kr(50, 0, 1, 0) * 100;
	//var lowLFO = LPF.ar(noise, inputFreq + lfo, 1, 0);

	// ------------Resonans
	//var resonans = RLPF.ar(noise, inputFreq, 0.5, 1, 0);

	// ------------ Bandpassfilter
	//var bandpass = BPF.ar(noise, inputFreq, 0.1, 1, 0);

	// --------------------- Bandstoppfilter
	//var sin = SinOsc.ar(1, 0, 1, 0).range(400, 800);
	//var bandstopp = BBandStop.ar(noise, inputFreq + sin, 0.5, 1, 0);

	// ----------------- Andra vs fjärde
	//var output = noise;
	//var filteredOutput = BLowPass4.ar(output, 400, 0.1);

	// -------- Självsvängning
	var mic = SoundIn.ar(1, 1, 0);
	var output = noise*0.04;
	var high = HPF.ar(mic, inputFreq, 1, 0)*2;
	var filteredOutput = BLowPass4.ar(mic, inputFreq.midicps, 0.5)*5;

	// --------------- Mikrofon




	FreqScope(400, 200, 0, server: s);


	Out.ar(0, {filteredOutput}!2);
}).play;
)

~mynoiseSynth = Synth.new(\noiseSynth).register;


{
	var notes = [57, 60, 64, 69];
	loop {
		notes.do { |note|
			~mynoiseSynth.set(\inputFreq, note); // Sätt tonen från listan
			1.0.wait;
		};
	};
}.fork;




ServerOptions.inDevices.postln;

var realtekR = "Microphone Array (Realtek(R) Au";
s.meter;






