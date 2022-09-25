import 'package:flutter/material.dart';
import 'package:metronome/models/beat_bullet.dart';
import 'package:metronome/models/time_signature.dart';

import '../../../models/beat_bar.dart';

class BeatBarWidget extends StatefulWidget {

  final TimeSignature signature;

  const BeatBarWidget({super.key, required this.signature});

  @override
  State<BeatBarWidget> createState() => _BeatBarWidgetState();
}

class _BeatBarWidgetState extends State<BeatBarWidget> {
  @override
  Widget build(BuildContext context) {
    return _buildBeatBar(widget.signature);
  }

  Widget _buildBeatBar(TimeSignature signature){

    BeatBar beats = BeatBar(signature: signature);
    List<Widget> bar = [];

    for (BeatBullet bullet in beats.beatBullets) {
      Color col = (bullet.isActive)? Colors.red : Colors.grey;

      bar.add(
        AnimatedContainer(
          duration: Duration.zero,
          margin: const EdgeInsets.only(left: 2.5, right: 2.5),
          width: 20,
          height: 20,
          decoration: BoxDecoration(shape: BoxShape.circle, color: col)
        )
      );
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: bar);
  }
}