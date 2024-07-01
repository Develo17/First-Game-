import 'dart:async';
import 'dart:math';

import 'package:first_game/common/background.dart';
import 'package:first_game/game/bullet.dart';
import 'package:first_game/game/enemy.dart';
import 'package:first_game/game_manager.dart';
import 'package:flame/components.dart';
import 'package:flame/src/gestures/events.dart';

import 'player.dart';

class GameScreen extends Component with HasGameRef<GameManager> {
  static const int playerLevelByScore = 20;
  late Player _player;
  late Timer enemySpawner;
  late Timer bulletSpawner;
  int score = 0;

  @override
  FutureOr<void> onLoad() async {
    enemySpawner = Timer(2, onTick: _spawnEnemy, repeat: true);
    bulletSpawner = Timer(2, onTick: _spawnBullet, repeat: true);

    add(Background(200));
    _player = Player(_onPlayerTouch);
    add(_player);
    add(Enemy(_onEnemyTouch));
  }

  void _spawnBullet() {
    var bullet = Bullet();
    bullet.position = _player.position.clone();
    add(bullet);
  }

  void _spawnEnemy() {
    for (int i = 0; i <= min(score ~/ playerLevelByScore, 2); i++) {
      add(Enemy(_onEnemyTouch));
    }
  }

  void _onEnemyTouch() {}

  void _onPlayerTouch() {}

  void onPanUpdate(DragUpdateInfo info) {
    if (isMounted) {
      _player.move(info.delta.global);
    }
  }

  @override
  void onMount() {
    super.onMount();
    enemySpawner.start();
    bulletSpawner.start();
  }

  @override
  void update(double dt) {
    super.update(dt);
    enemySpawner.update(dt);
    bulletSpawner.update(dt);
  }

  @override
  void onRemove() {
    super.onRemove();
    enemySpawner.stop();
    bulletSpawner.stop();
  }
}
