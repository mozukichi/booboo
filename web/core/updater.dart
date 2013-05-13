part of core;

class Updater {
  StreamController _streamController = new StreamController();
  Stream<num> _onUpdate;
  Stream<num> get onUpdate => _onUpdate;

  Updater() {
    _onUpdate = _streamController.stream;

    num lastTime = null;
    num countTime = 0.0;

    void update(time) {
      window.requestAnimationFrame(update);

      num delta;

      if (lastTime != null) {
        delta = (time - lastTime) / 1000.0;
      } else {
        delta = 0.0;
      }
      lastTime = time;

      _streamController.add(delta);

      countTime += delta;
      if (countTime > 1.0) {
        countTime %= 1.0;
        query('#fps').innerHtml = 'FPS: ${1.0 / delta}';
      }
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