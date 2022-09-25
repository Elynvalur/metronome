class TimeSignature{
  int activeBeat = 1;

  late int _beats;
  late int _signature;
  
  TimeSignature({int beats = 4, int timeSignature = 4}){
    _beats = beats;
    _signature = timeSignature;
  }

  // ignore: unnecessary_getters_setters
  int get beats => _beats;

  set beats(int value){
    _beats = value;
  }

  int get signature => _signature;

  set signature(int value){
    //TODO: Limit signature on powers of 2
    _signature = value;
  }

  void nextBeat(){
    //TODO: Write function
    if (activeBeat == _beats){
      activeBeat = 1;
    } else{
      activeBeat++;
    }
  }
}