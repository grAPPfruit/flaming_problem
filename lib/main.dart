import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flaming_problem/flaming_game.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Flame.device.fullScreen();
  Flame.device.setLandscape();

  final game = FlamingGame();
  runApp(GameWidget(game: game));
}
