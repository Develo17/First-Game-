import 'dart:async';

import 'package:first_game/common/background.dart';
import 'package:first_game/game_manager.dart';
import 'package:flame/components.dart';
import 'package:flame/src/gestures/events.dart';
import 'texte.dart';

class MainScreen extends Component with HasGameRef<GameManager>{
  final Function _onStartClicked;

  MainScreen(this._onStartClicked);

  @override
  FutureOr<void> onLoad() {
    add(Background(40));
    add(Text());
  }

  void onPanStart(DragStartInfo info) {
    if (isMounted) _onStartClicked();
  }
}