import 'dart:async';
import 'dart:math';
import 'dart:ui';

import 'package:flame/collisions.dart';
import 'package:first_game/game_manager.dart';
import 'package:flame/cache.dart';
import 'package:flame/components.dart';
import 'package:flame/sprite.dart';

class Enemy extends SpriteAnimationComponent
    with HasGameRef<GameManager>, HasCollisionDetection, CollisionCallbacks {
  final double _speed = 250;
  final VoidCallback onTouch;

  Enemy(this.onTouch);

  @override
  FutureOr<void> onLoad() async {
    var spriteSheet = SpriteSheet(
        image: await Images().load('enemy.png'), srcSize: Vector2(16.0, 16.0));
    animation = spriteSheet.createAnimation(row: 0, stepTime: 0.2);

    var size = 40.0;

    position = Vector2(
        Random()
            .nextInt((gameRef.size.toRect().width - size).toInt())
            .toDouble(),
        size);
    width = size;
    height = size;
    anchor = Anchor.center;
  }

  void move(Vector2 delta) {
    position.add(delta);
  }

  @override
  void update(double dt) {
    super.update(dt);
    position += Vector2(0, 1) * _speed * dt;
    if (position.y > gameRef.size.y) {
      removeFromParent();
    }
  }
}
