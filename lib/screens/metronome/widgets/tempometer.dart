import 'package:flutter/material.dart';
import '../../../models/tempo.dart';

class Tempometer extends StatelessWidget {

  final Tempo tempo;

  const Tempometer({
    super.key,
    required this.tempo
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      '${tempo.tempo}',
      style: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 40
      ),
    );
  }
}