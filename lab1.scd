s.boot;


(

SynthDef(\firstSynth, {
	var fas = 0.5;

	var output = SinOsc.ar(100, fas);

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
	var u = 660;

	var sin1 = SinOsc.ar(u-v, fas);
	var sin2 = SinOsc.ar(u+v, fas);

	var output = 0.5*(sin1-sin2);

	FreqScope(400, 200, 0, server: s);

	Out.ar(0, {output}!2);
}
).play;
)













