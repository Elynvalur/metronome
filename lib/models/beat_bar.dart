import 'package:metronome/models/beat_bullet.dart';
import 'package:metronome/models/time_signature.dart';

class BeatBar{
  late List<BeatBullet> beatBullets;

  BeatBar({required TimeSignature signature}){
    // When instantiated, beatBullets will be populated with the number of beats.
    beatBullets = _createBeatBullets(signature);
  }

  List<BeatBullet> _createBeatBullets(TimeSignature signature){
    List<BeatBullet> list = [];
    bool isActive = false;
    for (int i = 0; i < signature.signature; i++){
      isActive = (i == signature.beats-1)? true : false;
      list.add(BeatBullet(isActive: isActive));
    }
    return list;
  }
}