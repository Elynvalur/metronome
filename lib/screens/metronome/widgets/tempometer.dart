import 'package:flutter/material.dart';
import 'package:metronome/models/time_signature.dart';
import '../../../models/tempo.dart';

import '../../../constants/colors.dart';

class Tempometer extends StatelessWidget {
  final Tempo tempo;
  final TimeSignature signature;
  final Function notifyParent;

  Tempometer(
      {super.key,
      required this.tempo,
      required this.signature,
      required this.notifyParent});

  final TextStyle textStyleTimeSignature = const TextStyle(
    fontFamily: 'Times',
    color: textPrimary,
    fontWeight: FontWeight.bold,
    fontSize: 25,
  );

  final ButtonStyle buttonStyle = ButtonStyle(
      backgroundColor: MaterialStateProperty.all(Colors.transparent),
      elevation: MaterialStateProperty.all(10),
      side: MaterialStateProperty.all(const BorderSide(color: textPrimary)));

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
                onTap: () {
                  tempo.tempo--;
                  notifyParent();
                },
                child: Container(
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                            style: BorderStyle.solid,
                            color: textPrimary,
                            strokeAlign: StrokeAlign.center)),
                    child: const Icon(Icons.remove, size: 45, color: textPrimary))),
            const SizedBox(width: 20),
            Text(
              '${tempo.tempo}',
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: textPrimary,
                  fontSize: 80),
            ),
            const SizedBox(width: 10),
            Column(children: [
              Text('${signature.beatCount}', style: textStyleTimeSignature),
              Container(
                  margin: const EdgeInsets.only(top: 5, bottom: 5),
                  decoration: const BoxDecoration(color: textPrimary),
                  child: const SizedBox(width: 25, height: 2)),
              Text('${signature.signature}', style: textStyleTimeSignature),
            ]),
            const SizedBox(width: 20),
            GestureDetector(
                onTap: () {
                  tempo.tempo++;
                  notifyParent();
                },
                child: Container(
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                            style: BorderStyle.solid,
                            color: textPrimary,
                            strokeAlign: StrokeAlign.center)),
                    child: const Icon(Icons.add, size: 45, color: textPrimary)))
          ],
        ),
        Text(
          'One beat every ${(tempo.interval).toInt()} ms.',
          style: const TextStyle(color: textPrimary),
        ),
      ],
    );
  }
}
