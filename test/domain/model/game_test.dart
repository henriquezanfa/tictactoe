import 'package:flutter_test/flutter_test.dart';
import 'package:tictactoe/domain/enum/indicator_enum.dart';
import 'package:tictactoe/domain/model/game_model.dart';
import 'package:tictactoe/domain/model/player_model.dart';

void main() {
  Player? firstPlayer;
  Player? secondPlayer;

  setUp(() {
    firstPlayer = Player('first', IndicatorEnum.x);
    secondPlayer = Player('second', IndicatorEnum.o);
  });

  tearDown(() {
    firstPlayer = null;
    secondPlayer = null;
  });

  /// Remeber the board indexes:
  /// | 0 | 1 | 2 |
  /// | 3 | 4 | 5 |
  /// | 6 | 7 | 8 |
  ///

  test('Verify that Game.restart() works properly', () {
    final game = Game(firstPlayer!, secondPlayer!);
    _makeFirstPlayerWin(game);

    game.restart();

    expect(game.isDraw, false);
    expect(game.hasEnded, false);
    expect(game.winner, null);
  });

  test('Verify the score after 4 rounds', () {
    final game = Game(firstPlayer!, secondPlayer!);
    _makeFirstPlayerWin(game);
    game.restart();
    _makeFirstPlayerWin(game);
    game.restart();
    _makeSecondPlayerWin(game);
    game.restart();
    _makeDraw(game);

    expect(game.firstPlayer.score, 2);
    expect(game.secondPlayer.score, 1);
  });

  test('Verify a draw', () {
    final game = Game(firstPlayer!, secondPlayer!);
    // | X | X | O |
    // | O | O | X |
    // | X | O | X |
    game.makePlay(0);
    game.makePlay(2);
    game.makePlay(1);
    game.makePlay(3);
    game.makePlay(5);
    game.makePlay(4);
    game.makePlay(6);
    game.makePlay(7);
    game.makePlay(8);

    expect(game.hasEnded, true);
    expect(game.isDraw, true);
    expect(game.winner, null);
  });

  group('Verify wins', () {
    test('on the first line', () {
      final game = Game(firstPlayer!, secondPlayer!);
      // | X | X | X |
      // | O | O |   |
      // |   |   |   |
      game.makePlay(0);
      game.makePlay(3);
      game.makePlay(1);
      game.makePlay(4);
      game.makePlay(2);

      expect(game.hasEnded, true);
      expect(game.isDraw, false);
      expect(game.winner, firstPlayer);
    });

    test('on the second line', () {
      final game = Game(firstPlayer!, secondPlayer!);
      // | O | O |   |
      // | X | X | X |
      // |   |   |   |
      game.makePlay(3);
      game.makePlay(0);
      game.makePlay(4);
      game.makePlay(1);
      game.makePlay(5);

      expect(game.hasEnded, true);
      expect(game.isDraw, false);
      expect(game.winner, firstPlayer);
    });

    test('on the third line', () {
      final game = Game(firstPlayer!, secondPlayer!);
      // | O | O |   |
      // |   |   |   |
      // | X | X | X |
      game.makePlay(6);
      game.makePlay(0);
      game.makePlay(7);
      game.makePlay(1);
      game.makePlay(8);

      expect(game.hasEnded, true);
      expect(game.isDraw, false);
      expect(game.winner, firstPlayer);
    });

    test('on the first column', () {
      final game = Game(firstPlayer!, secondPlayer!);
      // | X | O |   |
      // | X | O |   |
      // | X |   |   |
      game.makePlay(0);
      game.makePlay(1);
      game.makePlay(3);
      game.makePlay(4);
      game.makePlay(6);

      expect(game.hasEnded, true);
      expect(game.isDraw, false);
      expect(game.winner, firstPlayer);
    });

    test('on the second column', () {
      final game = Game(firstPlayer!, secondPlayer!);
      // | O | X |   |
      // | O | X |   |
      // |   | X |   |
      game.makePlay(1);
      game.makePlay(0);
      game.makePlay(4);
      game.makePlay(3);
      game.makePlay(7);

      expect(game.hasEnded, true);
      expect(game.isDraw, false);
      expect(game.winner, firstPlayer);
    });

    test('on the third column', () {
      final game = Game(firstPlayer!, secondPlayer!);
      // | O |   | X |
      // | O |   | X |
      // |   |   | X |
      game.makePlay(2);
      game.makePlay(0);
      game.makePlay(5);
      game.makePlay(3);
      game.makePlay(8);

      expect(game.hasEnded, true);
      expect(game.isDraw, false);
      expect(game.winner, firstPlayer);
    });

    test('on the first diagonal', () {
      final game = Game(firstPlayer!, secondPlayer!);
      // | X |   |   |
      // | O | X |   |
      // | O |   | X |
      game.makePlay(0);
      game.makePlay(3);
      game.makePlay(4);
      game.makePlay(6);
      game.makePlay(8);

      expect(game.hasEnded, true);
      expect(game.isDraw, false);
      expect(game.winner, firstPlayer);
    });

    test('on the second diagonal', () {
      final game = Game(firstPlayer!, secondPlayer!);
      // | O |   | X |
      // | O | X |   |
      // | X |   |   |
      game.makePlay(2);
      game.makePlay(0);
      game.makePlay(4);
      game.makePlay(3);
      game.makePlay(6);

      expect(game.hasEnded, true);
      expect(game.isDraw, false);
      expect(game.winner, firstPlayer);
    });
  });
}

void _makeFirstPlayerWin(Game game) {
  game.makePlay(0);
  game.makePlay(3);
  game.makePlay(1);
  game.makePlay(4);
  game.makePlay(2);
}

void _makeSecondPlayerWin(Game game) {
  game.makePlay(3);
  game.makePlay(0);
  game.makePlay(4);
  game.makePlay(1);
  game.makePlay(7);
  game.makePlay(2);
}

void _makeDraw(Game game) {
  game.makePlay(0);
  game.makePlay(2);
  game.makePlay(1);
  game.makePlay(3);
  game.makePlay(5);
  game.makePlay(4);
  game.makePlay(6);
  game.makePlay(7);
  game.makePlay(8);
}
