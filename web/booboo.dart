library booboo;

import 'dart:html';
//import 'package:three/three.dart';
import '../../three/lib/three.dart';
import 'core/core.dart';

part 'car.dart';
part 'game_camera.dart';
part 'game_controller.dart';
part 'game_stage.dart';
part 'player_car.dart';

final int SCREEN_WIDTH = 640;
final int SCREEN_HEIGHT = 480;

WebGLRenderer renderer;
GameController controller;

main() {
  DivElement container = query('#main');

  renderer = new WebGLRenderer();
  renderer.setSize(640, 480);

  container.nodes.add(renderer.domElement);

  controller = new GameController();
  controller.start();
}