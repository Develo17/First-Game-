import 'package:first_game/game/game_screen.dart';
import 'package:first_game/main/main_screen.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';

class GameManager extends FlameGame with PanDetector{
  late GameScreen _gameScreen;
  late MainScreen _mainScreen;

  GameManager(){
    _mainScreen = MainScreen((){
      remove(_mainScreen);
      _gameScreen = GameScreen();
      add(_gameScreen);
    });
  }
  
  @override
  Future<void>? onLoad(){
    add(_mainScreen);
  }

  @override
  void onPanStart(DragStartInfo info) {
    super.onPanStart(info);
    _mainScreen.onPanStart(info);
  }

  @override
  void onPanUpdate(DragUpdateInfo info) {
    super.onPanUpdate(info);
    _gameScreen.onPanUpdate(info);
  }

}