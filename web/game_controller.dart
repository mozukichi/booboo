part of booboo;

class GameController {
  Scene _scene = new Scene();
  GameCamera _camera = new GameCamera();

  GameStage _stage = new GameStage();
  PlayerCar _playerCar = new PlayerCar();

  void start() {
    // デバッグ用のコースを作成
    _stage.createDebugCource();

    _scene
      ..add(_camera.camera)
      ..add(_playerCar.object)
      ..add(_stage.stageMesh);

    //_camera.follow = _playerCar.object;
    _camera.follow = _stage.stageMesh;

    updater.onUpdate.listen(_update);
  }

  void _update(num delta) {
    _playerCar.update(delta);
    _camera.update();

    _stage.stageMesh.rotation.y += 0.05;

    renderer.render(_scene, _camera.camera);
  }
}