import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
// import 'package:flame/rendering.dart'; // TODO 1: uncomment this
import 'package:flaming_problem/flaming_game.dart';
import 'package:flutter/material.dart';

class Enemy extends PositionComponent
    with HasGameRef<FlamingGame>, CollisionCallbacks {
  // , HasDecorator { // TODO 2: Uncomment this
  late final ShapeHitbox _hitbox;

  Vector2 _velocity = Vector2.zero();

  double _timeAlive = 0.0;
  double _acceleration = 0.0;
  double hp = 3;

  // TODO 3: Uncomment this
  // @override
  // Decorator? get decorator => PaintDecorator.blur(3.0);

  @override
  Paint get debugPaint {
    return super.debugPaint..color = Colors.red;
  }

  Enemy({
    required Vector2 position,
  }) : super(
          position: position,
          size: Vector2.all(20),
          anchor: Anchor.center,
        );

  @override
  void onLoad() {
    debugMode = true;

    _hitbox = CircleHitbox(isSolid: true)
      ..paint = debugPaint
      ..renderShape = debugMode;
    add(_hitbox);
  }

  @override
  void update(double dt) {
    super.update(dt);

    _timeAlive += dt;
    _acceleration += dt / 100;

    final dirToPlayer = (gameRef.level.player.position - position).normalized();
    final newVelocity = _velocity + dirToPlayer * _acceleration;

    if (_timeAlive > 5) {
      newVelocity.clampLength(0, 15);
    } else {
      final overSpeed = newVelocity.length - 15;
      newVelocity.clampLength(0, newVelocity.length - (overSpeed * dt));
    }
    _velocity = newVelocity;

    position.add(_velocity * dt);
  }

  @override
  void renderDebugMode(Canvas canvas) {
    final timeAlive = _timeAlive.toStringAsFixed(1);
    final velocity = _velocity.length.toStringAsFixed(1);
    debugTextPaint.render(
      canvas,
      't: $timeAlive v: $velocity',
      Vector2(5, height / 3),
    );
  }
}
