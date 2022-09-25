class TimeSignature {
  late int _beatCount;
  late List<bool> _activeBeats;
  late int _currentBeat;
  late int _signature;

  final int minBeats = 1;
  final int maxBeats = 16;

  TimeSignature({int beats = 4, int timeSignature = 4}) {
    _beatCount = beats;
    _currentBeat = 1;
    _signature = timeSignature;

    _initBeats(beats: _beatCount);
  }

  int get currentBeat => _currentBeat;

  List<bool> get beats => _activeBeats;

  int get beatCount => _beatCount;

  set beatCount(int value){
    if (value < minBeats) {
      _beatCount = minBeats;
    } else if (value > maxBeats) {
      _beatCount = maxBeats;
    } else {
      _beatCount = value;
    }
    if (_currentBeat > _beatCount) {
      _currentBeat = _beatCount;
    }
    _initBeats(beats: _beatCount, activeBeat: _currentBeat);
  }

  int get signature => _signature;

  set signature(int value) {
    //TODO: Limit signature on powers of 2
  }

  void _initBeats({required int beats, int activeBeat = 1}) {
    // Create the List of Beats and set the first Beat to true (isActive)
    _activeBeats = [];
    for (int i = 0; i < beats; i++) {
      if (i == activeBeat - 1) {
        _activeBeats.add(true);
      } else {
        _activeBeats.add(false);
      }
    }
  }

  void nextBeat() {
    
    _activeBeats[_currentBeat - 1] = false;
    if (_currentBeat == _beatCount) {
      _currentBeat = 1;
    } else {
      _currentBeat++;
    }
    _activeBeats[_currentBeat - 1] = true;
  }
}
