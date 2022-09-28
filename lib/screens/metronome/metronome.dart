import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:metronome/models/tempo.dart';
import 'package:metronome/models/time_signature.dart';
import 'package:metronome/screens/metronome/widgets/beat_bar_widget.dart';
import 'package:metronome/screens/metronome/widgets/controls.dart';
import 'package:metronome/screens/metronome/widgets/tempometer.dart';

import '../../constants/colors.dart';

// const clickSoundHigh = 'asset:assets/sounds/click_high.wav';
// const clickSoundLow = 'asset:assets/sounds/click_low.wav';

class Metronome extends StatefulWidget {
  const Metronome({super.key});

  @override
  State<Metronome> createState() => _MetronomeState();
}

class _MetronomeState extends State<Metronome>
    with SingleTickerProviderStateMixin {

  TimeSignature signature = TimeSignature(beats: 4);
  Tempo tempo = Tempo(tempo: 135);

  Duration elapsed = Duration.zero;

  // final AudioPlayer playerClickHigh = AudioPlayer()..setVolume(1.0)..setAsset(clickSoundHigh);
  // final AudioPlayer playerClickLow = AudioPlayer()..setVolume(1.0)..setAsset(clickSoundLow);
  final AudioPlayer playerLow = AudioPlayer();
  final AudioPlayer playerHigh = AudioPlayer();
  

  late final ticker = createTicker((elapsed) {
    this.elapsed = elapsed;
    update();
  });

  void update() {
    setState(() {});
  }

  @override
  void initState() {
    initAudioPlayer(playerLow, 'assets/sounds/click_low.mp3');
    initAudioPlayer(playerHigh, 'assets/sounds/click_high.mp3');
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
          leading: const Icon(Icons.track_changes),
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
      //click(playerClickHigh);
      click(playerHigh);
    } else {
      //click(playerClickLow);
      click(playerLow);
    }
    
    // Stops the current ticker and starts a new one.
    ticker..stop()..start();
  }

  void click(AudioPlayer player) async{
    await player.play();
    await player.seek(Duration.zero);
  }

}

void initAudioPlayer(AudioPlayer p, String assetPath) async {
  await p.setAsset(assetPath);
}
