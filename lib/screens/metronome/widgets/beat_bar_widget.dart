import 'package:flutter/material.dart';
import 'package:metronome/constants/colors.dart';
import 'package:metronome/models/time_signature.dart';

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

    List<Widget> beats = [];

    for (bool beat in signature.beats) { 
      beats.add(
        AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeOut,
          margin: const EdgeInsets.only(left: 2.5, right: 2.5),
          width: 20,
          height: 20,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: (beat)? beatBulletActive : beatBulletInactive
          )
        )
      );
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: beats
    );
  }
}