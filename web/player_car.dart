part of booboo;

class PlayerCar extends Car {
  PlayerCar() : super() {
    // TODO: プレイヤーの車のモデルを読み込む
    // 仮の豆腐を作成する
    CubeGeometry geometry = new CubeGeometry(1.0, 0.4, 2.0);
    MeshBasicMaterial material = new MeshBasicMaterial(color: 0x0000ff);
    object = new Mesh(geometry, material);
  }

  void update(num delta) {
    super.update(delta);

    object.rotation.y += 1.0 * delta;
  }
}