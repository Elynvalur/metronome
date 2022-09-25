class TimeSignature {
  late List<bool> _beats;
  late int _currentBeat;
  late int _signature;

  final int maxBeats = 16;

  TimeSignature({int beats = 4, int timeSignature = 4}) {
    _currentBeat = 1;
    _signature = timeSignature;

    _initBeats(beats: beats);
  }

  int get currentBeat => _currentBeat;

  List<bool> get beats => _beats;

  int get signature => _signature;

  set signature(int value) {
    //TODO: Limit signature on powers of 2
    if (value < 1) {
      _signature = 1;
    } else if (value > maxBeats) {
      _signature = maxBeats;
    } else {
      _signature = value;
    }
    if (_currentBeat > _signature) {
      _currentBeat = _signature;
    }
    _initBeats(beats: _signature, activeBeat: _currentBeat);
    
  }

  void _initBeats({required int beats, int activeBeat = 1}) {
    // Create the List of Beats and set the first Beat to true (isActive)
    _beats = [];
    for (int i = 0; i < beats; i++) {
      if (i == activeBeat - 1) {
        _beats.add(true);
      } else {
        _beats.add(false);
      }
    }
  }

  void nextBeat() {
    
    _beats[_currentBeat - 1] = false;
    if (_currentBeat == _signature) {
      _currentBeat = 1;
    } else {
      _currentBeat++;
    }
    _beats[_currentBeat - 1] = true;
  }
}
