Engine_FilterBank : CroneEngine {

  var <synth;

  *new { arg context, doneCallback;
    ^super.new(context, doneCallback);
  }

  alloc {
    SynthDef(\filterbank, {|inL, inR, out, amp,
      freq1, freq2, freq3, freq4, freq5, freq6, freq7, freq8, 
      amp1=0.25, amp2=0.25, amp3=0.25, amp4=0.25, amp5=0.25, amp6=0.25, amp7=0.25, amp8=0.25,
      ring1=0.25, ring2=0.25, ring3=0.25, ring4=0.25, ring5=0.25, ring6=0.25, ring7=0.25, ring8=0.25|

      var freqs = [freq1, freq2, freq3, freq4, freq5, freq6, freq7, freq8];
      var amps = [amp1, amp2, amp3, amp4, amp5, amp6, amp7, amp8];
      var rings = [ring1, ring2, ring3, ring4, ring5, ring6, ring7, ring8];

      var sound = [In.ar(inL), In.ar(inR)];
      var filters = DynKlank.ar(`[freqs, amps, rings], sound);

      Out.ar(out, filters*amp);
    }).add;

    context.server.sync;

    synth = Synth.new(\filterbank, [
      \inL, context.in_b[0].index,      
      \inR, context.in_b[1].index,
      \out, context.out_b.index,
      \amp, 1],
    context.xg);

// commands
    this.addCommand("amp", "f", {|msg|
      synth.set(\amp, msg[1]);
    });

    this.addCommand("freq1", "f", {|msg|
      synth.set(\freq1, msg[1]);
    });
    
    this.addCommand("freq2", "f", {|msg|
      synth.set(\freq2, msg[1]);
    });
    
    this.addCommand("freq3", "f", {|msg|
      synth.set(\freq3, msg[1]);
    });
    
    this.addCommand("freq4", "f", {|msg|
      synth.set(\freq4, msg[1]);
    });

    this.addCommand("freq5", "f", {|msg|
      synth.set(\freq5, msg[1]);
    });

    this.addCommand("freq6", "f", {|msg|
      synth.set(\freq6, msg[1]);
    });

    this.addCommand("freq7", "f", {|msg|
      synth.set(\freq7, msg[1]);
    });

    this.addCommand("freq8", "f", {|msg|
      synth.set(\freq8, msg[1]);
    });

    this.addCommand("amp1", "f", {|msg|
      synth.set(\amp1, msg[1]);
    });

    this.addCommand("amp2", "f", {|msg|
      synth.set(\amp2, msg[1]);
    });

    this.addCommand("amp3", "f", {|msg|
      synth.set(\amp3, msg[1]);
    });

    this.addCommand("amp4", "f", {|msg|
      synth.set(\amp4, msg[1]);
    });

    this.addCommand("amp5", "f", {|msg|
      synth.set(\amp5, msg[1]);
    });

    this.addCommand("amp6", "f", {|msg|
      synth.set(\amp6, msg[1]);
    });

    this.addCommand("amp7", "f", {|msg|
      synth.set(\amp7, msg[1]);
    });

    this.addCommand("amp8", "f", {|msg|
      synth.set(\amp8, msg[1]);
    });

    this.addCommand("ring1", "f", {|msg|
      synth.set(\ring1, msg[1]);
    });

    this.addCommand("ring2", "f", {|msg|
      synth.set(\ring2, msg[1]);
    });

    this.addCommand("ring3", "f", {|msg|
      synth.set(\ring3, msg[1]);
    });

    this.addCommand("ring4", "f", {|msg|
      synth.set(\ring4, msg[1]);
    });

    this.addCommand("ring5", "f", {|msg|
      synth.set(\ring5, msg[1]);
    });

    this.addCommand("ring6", "f", {|msg|
      synth.set(\ring6, msg[1]);
    });

    this.addCommand("ring7", "f", {|msg|
      synth.set(\ring7, msg[1]);
    });

    this.addCommand("ring8", "f", {|msg|
      synth.set(\ring8, msg[1]);
    });
  }

  free {
             // here you should free resources (e.g. Synths, Buffers &c)
// and stop processes (e.g. Routines, Tasks &c)
            synth.free;
  }

} 
