import 'package:flutter/material.dart';
import 'package:metronome/constants/colors.dart';

import '../../../models/tempo.dart';
import '../../../models/time_signature.dart';

class Controls extends StatelessWidget {
  final Tempo tempo;
  final TimeSignature signature;
  final Function() notifyParent;

  const Controls(
      {super.key,
      required this.tempo,
      required this.signature,
      required this.notifyParent});

  @override
  Widget build(BuildContext context) {
    ButtonStyle buttonStyle = ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Colors.transparent),
        elevation: MaterialStateProperty.all(10),
        side: MaterialStateProperty.all(const BorderSide(color: textPrimary)));

    Icon playButtonIcon = (tempo.isPlaying)? const Icon(Icons.pause) : const Icon(Icons.play_arrow);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  signature.beatCount++;
                  notifyParent();
                },
                style: buttonStyle,
                child: const Icon(Icons.add)),
            const SizedBox(
              width: 10,
            ),
            ElevatedButton(
                onPressed: () {
                  tempo.isPlaying = !tempo.isPlaying; // toggle the playing-Style
                  notifyParent();
                },
                style: buttonStyle,
                child: playButtonIcon),
            const SizedBox(
              width: 10,
            ),
            ElevatedButton(
                onPressed: () {
                  signature.beatCount--;
                  notifyParent();
                },
                style: buttonStyle,
                child: const Icon(Icons.remove))
          ],
        )
      ],
    );
  }
}
