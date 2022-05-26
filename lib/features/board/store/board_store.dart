import 'package:mobx/mobx.dart';
import 'package:tictactoe/domain/model/cell_model.dart';
import 'package:tictactoe/domain/model/game_model.dart';
import 'package:tictactoe/domain/model/player_model.dart';

part 'board_store.g.dart';

class BoardStore = _BoardStore with _$BoardStore;

abstract class _BoardStore with Store {
  late Game _game;

  @computed
  Player get firstPlayer => _game.firstPlayer;

  @computed
  Player get secondPlayer => _game.secondPlayer;

  @observable
  Player? winner;

  @observable
  bool isDraw = false;

  @observable
  Player? _currentPlayer;

  @observable
  ObservableList<Cell> board = ObservableList();

  @observable
  bool isPlaying = true;

  @action
  void makePlay(int cellIndex) {
    _game.makePlay(cellIndex);
    _currentPlayer = _game.currentPlayer;

    isDraw = _game.isDraw;
    _updatedBoard();
    _checkWinner();
  }

  @action
  void restart() {
    _game.restart();
    isDraw = _game.isDraw;
    _updatedBoard();
    _checkWinner();
  }

  @action
  void _updatedBoard() {
    board = ObservableList.of(_game.board);
  }

  @action
  void _checkWinner() {
    winner = _game.winner;
    isPlaying = _game.winner == null && !isDraw;
  }

  @action
  void initGame(Game game) {
    _game = game;
    _currentPlayer = firstPlayer;
    _updatedBoard();
    _checkWinner();
  }
}
