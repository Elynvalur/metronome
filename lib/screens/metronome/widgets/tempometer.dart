import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:metronome/models/time_signature.dart';
import '../../../models/tempo.dart';
import 'package:holding_gesture/holding_gesture.dart';
import '../../../constants/colors.dart';

class Tempometer extends StatelessWidget {
  final Tempo tempo;
  final TimeSignature signature;
  final Function notifyParent;

  const Tempometer(
      {super.key,
      required this.tempo,
      required this.signature,
      required this.notifyParent});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: Color.fromARGB(75, 0, 0, 0)),
      padding: const EdgeInsets.only(top: 20, bottom: 20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              
              Container(
                width: 60,
                //decoration: BoxDecoration(border: Border.all(color: Colors.red)),
                child: _buildChangeTempoButton(icon: Icons.remove, onHold: () => tempo.tempo--)),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    _buildTempoIndicator(),
                    const SizedBox(width: 10),
                    _buildTimeSignatureIndicator(),
                  ],
                ),
              ),
              Container(
                width: 60,
                //decoration: BoxDecoration(border: Border.all(color: Colors.red)),
                child: _buildChangeTempoButton(icon: Icons.add, onHold: () => tempo.tempo++))
              
            ],
          ),
          Text(
            'One beat every ${(tempo.interval).toInt()} ms.',
            style: const TextStyle(color: textPrimary),
          ),
        ],
      ),
    );
  }

  Widget _buildChangeTempoButton({IconData? icon, required Function onHold}) {
    return HoldDetector(
        onHold: () {
          onHold();
          notifyParent();
        },
        holdTimeout: const Duration(milliseconds: 80),
        enableHapticFeedback: true,
        child: Container(
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                    style: BorderStyle.solid,
                    color: textPrimary,
                    strokeAlign: BorderSide.strokeAlignCenter)),
            child: Icon(icon, size: 45, color: textPrimary)));
  }

  Widget _buildTempoIndicator() {
    const TextStyle textStyleTempoIndicator = TextStyle(
        fontWeight: FontWeight.bold,
        color: textPrimary,
        fontSize: 80,
        fontFeatures: [FontFeature.tabularFigures()],
        );

    return GestureDetector(
        onTap: () {
          tempo.tempo++;
          notifyParent();
        },
        child: Text('${tempo.tempo}', style: textStyleTempoIndicator));
  }

  Widget _buildTimeSignatureIndicator() {
    const TextStyle textStyleTimeSignature = TextStyle(
      fontFamily: 'Times',
      color: textPrimary,
      fontWeight: FontWeight.bold,
      fontSize: 25,
      fontFeatures: [FontFeature.tabularFigures()],
    );

    return Column(children: [
      Text('${signature.beatCount}', style: textStyleTimeSignature),
      Container(
          margin: const EdgeInsets.only(top: 5, bottom: 5),
          decoration: const BoxDecoration(color: textPrimary),
          child: const SizedBox(width: 25, height: 2)),
      Text('${signature.signature}', style: textStyleTimeSignature),
    ]);
  }
}
