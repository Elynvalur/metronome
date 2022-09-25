class TimeSignature{
  late int _beats;
  late int _signature;

  final int maxBeats = 16;
  
  TimeSignature({int beats = 4, int timeSignature = 4}){
    _beats = beats;
    _signature = timeSignature;
  }

  int get beats => _beats;

  int get signature => _signature;

  set signature(int value){
    //TODO: Limit signature on powers of 2
    if (value < 1){
      _signature = 1;
    } 
    else if (value > maxBeats){
      _signature = maxBeats;
    }
    else {
      _signature = value;
    }
    if (_beats > _signature){
      _beats = _signature;
    }
  }

  void nextBeat(){
    //TODO: Write function
    if (_beats == _signature){
      _beats = 1;
    } else{
      _beats++;
    }
  }
}