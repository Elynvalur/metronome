import 'package:flutter/material.dart';
import 'package:metronome/models/tempo.dart';
import 'package:metronome/models/time_signature.dart';
import 'package:metronome/screens/metronome/widgets/beat_bar_widget.dart';
import 'package:metronome/screens/metronome/widgets/controls.dart';
import 'package:metronome/screens/metronome/widgets/tempometer.dart';

import '../../constants/colors.dart';

class Metronome extends StatefulWidget {
  const Metronome({super.key});

  @override
  State<Metronome> createState() => _MetronomeState();
}

class _MetronomeState extends State<Metronome> with SingleTickerProviderStateMixin{
  TimeSignature signature = TimeSignature(beats: 7);
  Tempo tempo = Tempo(tempo: 130);

  Duration elapsed = Duration.zero;

  late final ticker = createTicker((elapsed) {
    setState((){
      this.elapsed = elapsed;
    });
  });
  
  void update() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {

    if (!tempo.isPlaying){
      // Stop the ticker if the metronome is in pause mode
      ticker.stop();
    } else {
      (ticker.isActive)? null : ticker.start();
    }


    if (elapsed.inMilliseconds >= tempo.interval){
      elapsed = Duration.zero;
      signature.nextBeat();
      ticker.stop();
      ticker.start();
    }

    return Scaffold(
        appBar: AppBar(
          backgroundColor: backgroundDark2,
          leading: const Icon(Icons.icecream),
          title: const Text('Metronome Pro'),
        ),
        backgroundColor: backgroundDark1,
        body: Container(
            padding: const EdgeInsets.symmetric(vertical: 50),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  BeatBarWidget(signature: signature),
                  Tempometer(tempo: tempo, signature: signature),
                  Controls(
                      signature: signature, tempo: tempo, notifyParent: update)
                ])));
  }
}

void changeTempo(Tempo t) {
  t.tempo = 900;
}
