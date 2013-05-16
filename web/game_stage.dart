part of booboo;

class GameStage {
  Geometry cource;
  Mesh stageMesh;

  /**
   * デバッグ用コースの作成
   */
  void createDebugCource() {
    Geometry geometry = new Geometry();
    MeshBasicMaterial material = new MeshBasicMaterial(color: 0x008800);
    Vector3 normal = new Vector3(0.0, -1.0, 0.0);
    var normals = [normal, normal, normal, normal];

    final radiusIn = 10.0;
    final radiusOut = 20.0;

    for (var i = 0; i < 8; i++) {
      Vector3 vecIn = new Vector3();
      Vector3 vecOut = new Vector3();

      num theta = PI * 2 * (i / 8);
      vecIn.setX(cos(theta) * radiusIn);
      vecIn.setY(0.0);
      vecIn.setZ(sin(theta) * radiusIn);
      vecOut.setX(cos(theta) * radiusOut);
      vecOut.setY(0.0);
      vecOut.setZ(sin(theta) * radiusOut);

      geometry.vertices.add(vecIn);
      geometry.vertices.add(vecOut);
    }

    for(var i = 0; i < 8; i++) {
      var a = (i * 2) % 16;
      var b = (a + 2) % 16;
      var c = (a + 3) % 16;
      var d = (a + 1) % 16;

      Face4 face = new Face4(a, b, c, d, normals);
      face.normal.addSelf(normal);
      face.normal.addSelf(normal);
      face.normal.addSelf(normal);
      face.normal.addSelf(normal);
      face.normal.normalize();

      geometry.faces.add(face);
    }

    geometry.computeCentroids();

    stageMesh = new Mesh(geometry, material);
  }
}