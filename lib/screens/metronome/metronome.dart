import 'package:flutter/material.dart';
import 'package:metronome/models/tempo.dart';
import 'package:metronome/models/time_signature.dart';
import 'package:metronome/screens/metronome/widgets/controls.dart';

import '../../constants/colors.dart';

class Metronome extends StatefulWidget {
  const Metronome({super.key});

  @override
  State<Metronome> createState() => _MetronomeState();
}

class _MetronomeState extends State<Metronome> {

  Tempo tempo = Tempo(tempo: 150);
  TimeSignature signature = TimeSignature();

  void update(){
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgLight,
      body: Center(
        child: Controls(
          signature: signature,
          tempo: tempo,
          notifyParent: update
        ),
      ),
    );
  }
}

  void changeTempo(Tempo t){
    t.tempo = 900;
    print('Tempo: ${t.tempo}');
  }