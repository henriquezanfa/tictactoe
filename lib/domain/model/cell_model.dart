import 'dart:ui';

import 'package:tictactoe/domain/enum/indicator_enum.dart';
import 'package:tictactoe/domain/model/player_model.dart';

class Cell {
  final Player player;
  final bool winner;

  Cell(this.player, this.winner);

  Cell copyWith({bool winner = false}) => Cell(player, winner);

  @override
  bool operator ==(Object other) {
    if (other is! Cell) return false;
    return player.name == other.player.name &&
        (player.indicator.name == other.player.indicator.name);
  }

  @override
  int get hashCode => hashValues(player.name, player.indicator.name);
}

class EmptyCell extends Cell {
  EmptyCell() : super(Player('', IndicatorEnum.empty), false);
}
