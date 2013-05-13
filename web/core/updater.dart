part of core;

class Updater {
  StreamController _streamController = new StreamController();
  Stream<num> _onUpdate;
  Stream<num> get onUpdate => _onUpdate;
  
  Updater() {
    _onUpdate = _streamController.stream;
    
    num lastTime = null;
    
    void update(time) {
      window.requestAnimationFrame(update);
      
      num delta;
      
      if (lastTime != null) {
        delta = time - lastTime;
      } else {
        delta = 0.0;  
      }
      lastTime = time;
      
      _streamController.add(delta);
    }
    
    window.requestAnimationFrame(update);
  }
}

Updater _updater;

Updater get updater {
  if (_updater != null) {
    return _updater;
  }
  _updater = new Updater();
  return _updater;
}