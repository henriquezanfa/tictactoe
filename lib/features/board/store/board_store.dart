import 'package:mobx/mobx.dart';

part 'board_store.g.dart';

class BoardStore = _BoardStore with _$BoardStore;

abstract class _BoardStore with Store {}
