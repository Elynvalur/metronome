import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../../models/tempo.dart';
import '../../../models/time_signature.dart';

class Controls extends StatelessWidget {

  final Tempo tempo;
  final TimeSignature signature;
  final Function() notifyParent;

  const Controls({
    super.key,
    required this.tempo,
    required this.signature,
    required this.notifyParent
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Tempo: ${tempo.tempo}'),
        Text('Beats: ${signature.beats}/${signature.signature}'),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: (){
                signature.signature++;
                notifyParent();
              },
              child: const Icon(Icons.add)
            ),
            const SizedBox(
              width: 10,
            ),
            ElevatedButton(
              onPressed: (){
                signature.nextBeat();
                notifyParent();
              },
              child: const Text('Step')
            ),
            const SizedBox(
              width: 10,
            ),
            ElevatedButton(
              onPressed: (){
                signature.signature--;
                notifyParent();
              },
              child: const Icon(Icons.remove)
            )
          ],
        )
      ],
    );
  }
}