class Tempo{
  late int _tempo;

  final int maxTempo;
  final int minTempo;
  bool isPlaying = false;

  Tempo({tempo = 120, this.minTempo = 50, this.maxTempo = 300}){
    _tempo = tempo;
  }

  int get tempo => _tempo;

  set tempo(int value){
    if (value > maxTempo){
      _tempo = maxTempo;
    }
    else if (value < minTempo){
      _tempo = minTempo;
    }
    else{
      _tempo = value;
    }
  }
}