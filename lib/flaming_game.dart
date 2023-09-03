import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flame/input.dart';
import 'package:flaming_problem/level.dart';

class FlamingGame extends FlameGame
    with HasCollisionDetection, HasKeyboardHandlerComponents {
  late final Level level;
  late final CameraComponent cameraComponent;

  @override
  void onLoad() {
    addAll([
      level = Level(),
      cameraComponent = CameraComponent(world: level),
    ]);
    cameraComponent.viewfinder.zoom = 1.0;
  }
}
