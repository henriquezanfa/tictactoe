class CellNotEmptyException implements Exception {
  final String error;

  CellNotEmptyException({this.error = 'Cell is not empty'});

  @override
  String toString() => error;
}
