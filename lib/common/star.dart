import 'dart:async';
import 'dart:math';

import 'package:first_game/game_manager.dart';
import 'package:flame/cache.dart';
import 'package:flame/components.dart';
import 'package:flame/sprite.dart';

class Star extends SpriteAnimationComponent with HasGameRef<GameManager> {
  @override
  FutureOr<void> onLoad() async {
    // TODO: implement onLoad
    var spriteSheet = SpriteSheet(
        image: await Images().load("stars.png"), srcSize: Vector2(9.0, 9.0));
    animation = spriteSheet.createAnimation(
        row: Random().nextInt(3) + 1,
        stepTime: (Random().nextInt(50) / 10) + 0.2);

    var size = Random().nextInt(10).toDouble() + 10;
    var x = Random()
        .nextInt((gameRef.size.toRect().width - size).toInt())
        .toDouble();
    var y = Random()
        .nextInt((gameRef.size.toRect().width - size).toInt())
        .toDouble();

    width = size;
    height = size;
    position = Vector2(x, y);
    anchor = Anchor.center;
  }
}
