import 'package:flutter/material.dart';
import 'package:metronome/screens/metronome/metronome.dart';

void main() {
  runApp(const MetronomeApp());
}

class MetronomeApp extends StatefulWidget {
  const MetronomeApp({super.key});

  @override
  State<MetronomeApp> createState() => _MetronomeState();
}

class _MetronomeState extends State<MetronomeApp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Metronome()
    );
  }
}