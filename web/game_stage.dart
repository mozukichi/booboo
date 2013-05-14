part of booboo;

class GameStage {
  Geometry cource;
  Mesh stageMesh;

  /**
   * デバッグ用コースの作成
   */
  void createDebugCource() {
    Geometry geometry = new TorusGeometry(10, 5, 6, 8, PI * 2);
    Material material = new MeshBasicMaterial(color: 0x335544);
    stageMesh = new Mesh(geometry, material);
  }
}