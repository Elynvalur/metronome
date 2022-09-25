import 'package:flutter/material.dart';
import 'package:metronome/models/tempo.dart';

import '../constants/colors.dart';

class Metronome extends StatefulWidget {
  const Metronome({super.key});

  @override
  State<Metronome> createState() => _MetronomeState();
}

class _MetronomeState extends State<Metronome> {

  Tempo t = Tempo(tempo: 990);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgLight,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Tempo: ${t.tempo}'),
            ElevatedButton(onPressed: (){changeTempo(t);}, child: const Text('Test'))
          ],
        )
      ),
    );
  }
}

  void changeTempo(Tempo t){
    t.tempo = 900;
    print('Tempo: ${t.tempo}');
  }