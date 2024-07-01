import 'dart:async';

import 'package:first_game/game_manager.dart';
import 'package:flame/components.dart';

class Text extends SpriteComponent with HasGameRef<GameManager> {
  @override
  FutureOr<void> onLoad() async {
    sprite = await Sprite.load("start.png");
    anchor = Anchor.center;
    position = gameRef.size / 2;

    var originalSize = sprite?.originalSize;
    if (originalSize == null) return;
    var height = gameRef.size.toSize().height / 9;
    var width =
        originalSize.toSize().width * (height / originalSize.toSize().height);
    size = Vector2(width, height);

    return super.onLoad();
  }
}
