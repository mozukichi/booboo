import 'dart:html';
import 'package:three/three.dart';

Scene scene;
PerspectiveCamera camera;
WebGLRenderer renderer;
Mesh cube;

main() {
  DivElement container = query('#main');
  
  scene = new Scene();
  
  camera = new PerspectiveCamera(70, 640 / 480, 1, 1000);
  camera.position.z = 400;

  scene.add(camera);

  CubeGeometry geometry = new CubeGeometry(200, 200, 200);
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
