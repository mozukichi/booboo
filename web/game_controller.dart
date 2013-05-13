part of booboo;

class GameController {
  Scene _scene;
  GameCamera _camera;
  
  GameStage _stage;
  PlayerCar _playerCar;
  
  GameController()
      : _scene = new Scene(),
        _camera = new GameCamera(),
        _playerCar = new PlayerCar();
  
  void start() {
    _scene.add(_camera.camera);
    _scene.add(_playerCar.object);
    
    _camera.follow = _playerCar.object;
    
    updater.onUpdate.listen(_update);
  }
  
  void _update(num delta) {
    _playerCar.update(delta);
    _camera.update();
    
    renderer.render(_scene, _camera.camera);
  }
}