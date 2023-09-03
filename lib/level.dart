import 'dart:math';

import 'package:flame/components.dart';
import 'package:flaming_problem/enemy.dart';
import 'package:flaming_problem/flaming_game.dart';
import 'package:flaming_problem/player.dart';
import 'package:flutter/services.dart';

final _random = Random();

class Level extends World with HasGameRef<FlamingGame>, KeyboardHandler {
  late final Player player;

  @override
  void onLoad() {
    add(player = Player());
    _addEnemyAtRandomPosition();
  }

  @override
  bool onKeyEvent(RawKeyEvent event, Set<LogicalKeyboardKey> keysPressed) {
    if (keysPressed.contains(LogicalKeyboardKey.numpadAdd) ||
        keysPressed.contains(LogicalKeyboardKey.add)) {
      _addEnemyAtRandomPosition();
    }
    return false;
  }

  void _addEnemyAtRandomPosition() {
    final spawnPosition = _getSpawnPosition();
    add(Enemy(position: spawnPosition));
  }

  Vector2 _getSpawnPosition() {
    final size = Vector2(500, 500);
    final spawnX = _random.nextDouble() * size.x - size.x / 2;
    final spawnY = _random.nextDouble() * size.y - size.y / 2;
    return Vector2(spawnX, spawnY);
  }
}
