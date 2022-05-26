class CellNotEmptyException implements Exception {
  final String error;

  CellNotEmptyException({this.error = 'Cell is not empty'});

  @override
  String toString() => error;
}

class EndGameException implements Exception {
  final String error;

  EndGameException({this.error = 'The game has ended'});

  @override
  String toString() => error;
}
