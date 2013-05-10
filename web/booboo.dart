import 'dart:html';
//import 'package:three/three.dart';
import '../../three/lib/three.dart';

Scene scene;
PerspectiveCamera camera;
WebGLRenderer renderer;
Mesh cube;

main() {
  DivElement container = query('#main');
  
  scene = new Scene();
  
  camera = new PerspectiveCamera(70.0, 640.0 / 480.0, 1.0, 1000.0);
  camera.position.setValues(0.0, 0.0, 400.0);
  //camera.position.z = 400.0;

  scene.add(camera);

  CubeGeometry geometry = new CubeGeometry(200.0, 200.0, 200.0);
  MeshBasicMaterial material = new MeshBasicMaterial(color: 0x0000ff);

  cube = new Mesh(geometry, material);
  scene.add(cube);

  renderer = new WebGLRenderer();
  renderer.setSize(640, 480);

  container.nodes.add(renderer.domElement);

  animate(0);
}

animate(num time) {
  window.requestAnimationFrame(animate);

  cube.rotation.x += 0.005;
  cube.rotation.y += 0.01;

  renderer.render(scene, camera);
}
