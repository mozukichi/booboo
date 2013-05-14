part of booboo;

class GameCamera {
  static final ANGLE_OF_VIEW = 70.0;
  static final ASPECT_RATE = SCREEN_WIDTH / SCREEN_HEIGHT;
  static final NEAR_CLIP = 1.0;
  static final FAR_CLIP = 1000.0;

  PerspectiveCamera camera;
  Object3D follow;
  Vector3 _followOffset;

  GameCamera()
      : camera = new PerspectiveCamera(
            GameCamera.ANGLE_OF_VIEW,
            GameCamera.ASPECT_RATE,
            GameCamera.NEAR_CLIP, GameCamera.FAR_CLIP) {
        camera.position.z = 5.0;
        _followOffset = new Vector3(0.0, 15.0, 7.0);
  }

  void update() {
    /*camera.position.setValues(
        follow.position.x + _followOffset.x,
        follow.position.y + _followOffset.y,
        follow.position.z + _followOffset.z);*/
    camera.position.x += 0.05;
    camera.lookAt(follow.position);
  }
}