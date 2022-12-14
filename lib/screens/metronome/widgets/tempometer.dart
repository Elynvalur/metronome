import 'package:flutter/material.dart';
import 'package:metronome/models/time_signature.dart';
import '../../../models/tempo.dart';

import '../../../constants/colors.dart';

class Tempometer extends StatelessWidget {
  final Tempo tempo;
  final TimeSignature signature;

  const Tempometer({super.key, required this.tempo, required this.signature});

  final TextStyle textStyleTimeSignature =  const TextStyle(
      fontFamily: 'Times',
      color: textPrimary,
      fontWeight: FontWeight.bold,
      fontSize: 25,
    );

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '${tempo.tempo}',
              style: const TextStyle(
                  fontWeight: FontWeight.bold, color: textPrimary, fontSize: 80),
            ),
            const SizedBox(width: 10),
            Column(
              children: [
                Text('${signature.beatCount}', style: textStyleTimeSignature),
                Container(
                  margin: const EdgeInsets.only(top: 5, bottom: 5),
                  decoration: const BoxDecoration(color: textPrimary),
                  child: const SizedBox(width: 25, height: 2)),
                Text('${signature.signature}', style: textStyleTimeSignature)
              ]
            )
          ],
        ),
        Text(
          'One beat every ${(tempo.interval).toInt()} ms.',
          style: const TextStyle(
            color: textPrimary),
        ),
      ],
    );
  }
}
