import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:metronome/models/tempo.dart';
import 'package:metronome/models/time_signature.dart';
import 'package:metronome/screens/metronome/widgets/beat_bar_widget.dart';
import 'package:metronome/screens/metronome/widgets/controls.dart';
import 'package:metronome/screens/metronome/widgets/tempometer.dart';

import '../../constants/colors.dart';

const clickSoundHigh = 'sounds/click_high.wav';
const clickSoundLow = 'sounds/click_low.wav';

class Metronome extends StatefulWidget {
  const Metronome({super.key});

  @override
  State<Metronome> createState() => _MetronomeState();
}

class _MetronomeState extends State<Metronome>
    with SingleTickerProviderStateMixin {

  TimeSignature signature = TimeSignature(beats: 7);
  Tempo tempo = Tempo(tempo: 60);

  Duration elapsed = Duration.zero;


  late final ticker = createTicker((elapsed) {
    this.elapsed = elapsed;
    update();
  });

  void update() {
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (!tempo.isPlaying) {
      // Stop the ticker if the metronome is in pause mode
      ticker.stop();
      signature.stop();
    } else {
      (ticker.isActive) ? null : nextBeat();
    }

    if (elapsed.inMilliseconds >= tempo.interval) {
      nextBeat();
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

  void nextBeat(){
    elapsed = Duration.zero;
    
    signature.nextBeat();
    if (signature.currentBeat == 1){
      click(playerHigh);
    } else {
      click(playerLow);
    }
    
    // Stops the current ticker and starts a new one.
    ticker..stop()..start();
  }

  Future<void> click(AudioPlayer player) async {
  await player.stop();
  await player.resume();
  }
}

