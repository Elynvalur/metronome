class TimeSignature {
  late int _beatCount;
  late List<bool> _beats;
  int _currentBeat = 0;
  late int _signature;

  final int minBeats = 1;
  final int maxBeats = 16;

  TimeSignature({int beats = 4, int timeSignature = 4}) {
    _beatCount = beats;
    _signature = timeSignature;

    _initBeats(beats: _beatCount);
  }

  int? get currentBeat => _currentBeat;

  List<bool> get beats => _beats;

  int get beatCount => _beatCount;

  set beatCount(int value) {
    if (value < minBeats) {
      _beatCount = minBeats;
    } else if (value > maxBeats) {
      _beatCount = maxBeats;
    } else {
      _beatCount = value;
    }
    if (_currentBeat > _beatCount){
      _currentBeat = _beatCount;
    }
    _initBeats(beats: _beatCount, activeBeat: _currentBeat);
  }

  int get signature => _signature;

  set signature(int value) {
    //TODO: Limit signature on powers of 2
  }

  void _initBeats({required int beats, int? activeBeat}) {
    // Create the List of Beats and set the first Beat to true (isActive)
    activeBeat ??= 0;
    _beats = [];
    for (int i = 0; i < beats; i++) {
      if (i == activeBeat - 1) {
        _beats.add(true);
      } else {
        _beats.add(false);
      }
    }
  }

  void stop(){
    //Reset the current beat back to 0.
    _currentBeat = 0;
    _initBeats(beats: _beatCount);
  }

  void nextBeat() {
    // Only set the current beat to inactive (false) in case the ticker was active already, thus current beat was at least 1.
    if (_currentBeat > 0){
    _beats[_currentBeat - 1] = false;
    }
  
    // Proceed to the next beat if the current beat does not match the total amounts of beats in the bar yet. Otherwise, jump back to the first beat.
    if (_currentBeat < _beatCount) {
      _currentBeat = _currentBeat + 1;
    } else {
      _currentBeat = 1;
    }
    // Set the index of the current beat to true (active).
    _beats[_currentBeat - 1] = true;
  }
}
