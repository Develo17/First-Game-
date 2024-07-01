import 'dart:async';
import 'dart:ui';

import 'package:first_game/game_manager.dart';
import 'package:flame/cache.dart';
import 'package:flame/components.dart';
import 'package:flame/sprite.dart';

class Player extends SpriteAnimationComponent with HasGameRef<GameManager> {
  final VoidCallback onTouch;

  Player(this.onTouch);

  @override
  FutureOr<void> onLoad() async {
    var spriteSheet = SpriteSheet(
        image: await Images().load('player.png'), srcSize: Vector2(32.0, 48.0));
    animation = spriteSheet.createAnimation(row: 0, stepTime: 0.2);

    position = gameRef.size / 2;
    width = 80;
    height = 120;
    anchor = Anchor.center;
  }

  void move(Vector2 delta){
    position.add(delta);
  }
}
