// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'board_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$BoardStore on _BoardStore, Store {
  Computed<Player>? _$firstPlayerComputed;

  @override
  Player get firstPlayer =>
      (_$firstPlayerComputed ??= Computed<Player>(() => super.firstPlayer,
              name: '_BoardStore.firstPlayer'))
          .value;
  Computed<Player>? _$secondPlayerComputed;

  @override
  Player get secondPlayer =>
      (_$secondPlayerComputed ??= Computed<Player>(() => super.secondPlayer,
              name: '_BoardStore.secondPlayer'))
          .value;

  late final _$winnerAtom = Atom(name: '_BoardStore.winner', context: context);

  @override
  Player? get winner {
    _$winnerAtom.reportRead();
    return super.winner;
  }

  @override
  set winner(Player? value) {
    _$winnerAtom.reportWrite(value, super.winner, () {
      super.winner = value;
    });
  }

  late final _$isDrawAtom = Atom(name: '_BoardStore.isDraw', context: context);

  @override
  bool get isDraw {
    _$isDrawAtom.reportRead();
    return super.isDraw;
  }

  @override
  set isDraw(bool value) {
    _$isDrawAtom.reportWrite(value, super.isDraw, () {
      super.isDraw = value;
    });
  }

  late final _$_currentPlayerAtom =
      Atom(name: '_BoardStore._currentPlayer', context: context);

  @override
  Player? get _currentPlayer {
    _$_currentPlayerAtom.reportRead();
    return super._currentPlayer;
  }

  @override
  set _currentPlayer(Player? value) {
    _$_currentPlayerAtom.reportWrite(value, super._currentPlayer, () {
      super._currentPlayer = value;
    });
  }

  late final _$boardAtom = Atom(name: '_BoardStore.board', context: context);

  @override
  ObservableList<Cell> get board {
    _$boardAtom.reportRead();
    return super.board;
  }

  @override
  set board(ObservableList<Cell> value) {
    _$boardAtom.reportWrite(value, super.board, () {
      super.board = value;
    });
  }

  late final _$isPlayingAtom =
      Atom(name: '_BoardStore.isPlaying', context: context);

  @override
  bool get isPlaying {
    _$isPlayingAtom.reportRead();
    return super.isPlaying;
  }

  @override
  set isPlaying(bool value) {
    _$isPlayingAtom.reportWrite(value, super.isPlaying, () {
      super.isPlaying = value;
    });
  }

  late final _$_BoardStoreActionController =
      ActionController(name: '_BoardStore', context: context);

  @override
  void makePlay(int cellIndex) {
    final _$actionInfo =
        _$_BoardStoreActionController.startAction(name: '_BoardStore.makePlay');
    try {
      return super.makePlay(cellIndex);
    } finally {
      _$_BoardStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void restart() {
    final _$actionInfo =
        _$_BoardStoreActionController.startAction(name: '_BoardStore.restart');
    try {
      return super.restart();
    } finally {
      _$_BoardStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void _updatedBoard() {
    final _$actionInfo = _$_BoardStoreActionController.startAction(
        name: '_BoardStore._updatedBoard');
    try {
      return super._updatedBoard();
    } finally {
      _$_BoardStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void _checkWinner() {
    final _$actionInfo = _$_BoardStoreActionController.startAction(
        name: '_BoardStore._checkWinner');
    try {
      return super._checkWinner();
    } finally {
      _$_BoardStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void initGame(Game game) {
    final _$actionInfo =
        _$_BoardStoreActionController.startAction(name: '_BoardStore.initGame');
    try {
      return super.initGame(game);
    } finally {
      _$_BoardStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
winner: ${winner},
isDraw: ${isDraw},
board: ${board},
isPlaying: ${isPlaying},
firstPlayer: ${firstPlayer},
secondPlayer: ${secondPlayer}
    ''';
  }
}
