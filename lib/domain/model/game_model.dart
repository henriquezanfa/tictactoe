import 'package:collection/collection.dart';
import 'package:tictactoe/commons/exceptions/exceptions.dart';
import 'package:tictactoe/domain/model/cell_model.dart';
import 'package:tictactoe/domain/model/player_model.dart';

class Game {
  final Player firstPlayer;
  final Player secondPlayer;

  Player _currentPlayer;
  Player? _winner;
  bool _isDraw = false;

  Player get currentPlayer => _currentPlayer;
  Player? get winner => _winner;
  bool get isDraw => _isDraw;
  bool get hasEnded => winner != null || isDraw;

  final List<Cell> board = List.filled(9, EmptyCell());

  Game(this.firstPlayer, this.secondPlayer) : _currentPlayer = firstPlayer;

  void makePlay(int index) {
    if (!hasEnded) {
      if (board[index] is EmptyCell) {
        board[index] = Cell(_currentPlayer, false);
        final isWinner = _isWinPlay(_currentPlayer, index);
        if (isWinner) {
          _currentPlayer.incrementScore();
          _winner = _currentPlayer;
        }
        _changePlayer();
      } else {
        throw CellNotEmptyException();
      }
    } else {
      throw EndGameException();
    }

    _checkDraw();
  }

  void restart() {
    for (int i = 0; i < board.length; i++) {
      board[i] = EmptyCell();
    }
    _winner = null;
    _currentPlayer = firstPlayer;
    _checkDraw();
  }

  void _changePlayer() {
    if (_currentPlayer == firstPlayer) {
      _currentPlayer = secondPlayer;
    } else {
      _currentPlayer = firstPlayer;
    }
  }

  /// Check if any of the cells is a [EmptyCell] and [winner] is null.
  bool _checkDraw() {
    _isDraw =
        board.firstWhereOrNull((x) => x is EmptyCell) == null && winner == null;

    return _isDraw;
  }

  void _setWinnerCells(int firstIndex, int secondIndex, int thirdIndex) {
    board[firstIndex] = board[firstIndex].copyWith(winner: true);
    board[secondIndex] = board[secondIndex].copyWith(winner: true);
    board[thirdIndex] = board[thirdIndex].copyWith(winner: true);
  }

  /// Check if the current play makes the player wins.
  ///
  /// If it is, set the winner cells.
  bool _isWinPlay(Player player, int index) {
    // First line
    if (board[0] is! EmptyCell &&
        board[0] == board[1] &&
        board[1] == board[2]) {
      _setWinnerCells(0, 1, 2);
      return true;
    }

    // Second line
    if (board[3] is! EmptyCell &&
        board[3] == board[4] &&
        board[4] == board[5]) {
      _setWinnerCells(3, 4, 5);
      return true;
    }

    // Third line
    if (board[6] is! EmptyCell &&
        board[6] == board[7] &&
        board[7] == board[8]) {
      _setWinnerCells(6, 7, 8);
      return true;
    }

    // First column
    if (board[0] is! EmptyCell &&
        board[0] == board[3] &&
        board[3] == board[6]) {
      _setWinnerCells(0, 3, 6);
      return true;
    }

    // Second column
    if (board[1] is! EmptyCell &&
        board[1] == board[4] &&
        board[4] == board[7]) {
      _setWinnerCells(1, 4, 7);
      return true;
    }

    // Third column
    if (board[2] is! EmptyCell &&
        board[2] == board[5] &&
        board[5] == board[8]) {
      _setWinnerCells(2, 5, 8);
      return true;
    }

    // First diagonal
    if (board[0] is! EmptyCell &&
        board[0] == board[4] &&
        board[4] == board[8]) {
      _setWinnerCells(0, 4, 8);
      return true;
    }

    // Second diagonal
    if (board[2] is! EmptyCell &&
        board[2] == board[4] &&
        board[4] == board[6]) {
      _setWinnerCells(2, 4, 6);
      return true;
    }

    return false;
  }
}
