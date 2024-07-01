import 'dart:async';

import 'package:first_game/common/star.dart';
import 'package:first_game/game_manager.dart';
import 'package:flame/components.dart';

class Background extends Component with HasGameRef<GameManager>{
  int nbStars;

  Background(this.nbStars);
   @override
  FutureOr<void> onLoad() {
     for (int i = 0; i < nbStars; i++){
       add(Star());
     }
  }
}