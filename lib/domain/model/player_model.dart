import 'package:tictactoe/domain/enum/indicator_enum.dart';

class Player {
  final String name;
  final IndicatorEnum indicator;

  int get score => _score;

  int _score;

  Player(
    this.name,
    this.indicator, {
    int initialScore = 0,
  }) : _score = initialScore;

  void incrementScore() {
    _score++;
  }
}
