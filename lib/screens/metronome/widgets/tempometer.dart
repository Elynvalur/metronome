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
            _buildChangeTempoButton(icon: Icons.remove, onTap: () => tempo.tempo--),
            const SizedBox(width: 20),
            // Tempo
            _buildTempoIndicator(),

            const SizedBox(width: 10),
            
            _buildTimeSignatureIndicator(),

            const SizedBox(width: 20),

            _buildChangeTempoButton(icon: Icons.add, onTap: () => tempo.tempo++),
          ],
        ),
        Text(
          'One beat every ${(tempo.interval).toInt()} ms.',
          style: const TextStyle(color: textPrimary),
        ),
      ],
    );
  }

  Widget _buildChangeTempoButton({IconData? icon, required Function onTap}){

    return GestureDetector(
                onTap: () {
                  onTap();
                  notifyParent();
                },
                child: Container(
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                            style: BorderStyle.solid,
                            color: textPrimary,
                            strokeAlign: BorderSide.strokeAlignCenter)),
                    child: Icon(icon,
                        size: 45, color: textPrimary)));

  }

  Widget _buildTempoIndicator(){

    const TextStyle textStyleTempoIndicator = TextStyle(
    fontWeight: FontWeight.bold, color: textPrimary, fontSize: 80);

    return GestureDetector(
      onLongPress: () {
        tempo.tempo++;
        notifyParent();
      },
      child: Text('${tempo.tempo}', style: textStyleTempoIndicator));
  }

  Widget _buildTimeSignatureIndicator(){
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