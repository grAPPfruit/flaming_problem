import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flaming_problem/flaming_game.dart';

class Player extends PositionComponent with HasGameRef<FlamingGame> {
  static const double _radius = 10;

  late final ShapeHitbox _hitbox;

  Player()
      : super(
          position: Vector2.zero(),
          size: Vector2.all(2 * _radius),
          anchor: Anchor.center,
        );

  @override
  void onLoad() {
    debugMode = true;

    _hitbox = CircleHitbox(radius: _radius)
      ..paint = debugPaint
      ..renderShape = debugMode;

    add(_hitbox);
  }
}
