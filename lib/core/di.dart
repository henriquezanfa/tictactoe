import 'package:get_it/get_it.dart';
import 'package:tictactoe/features/board/store/board_store.dart';
import 'package:tictactoe/features/home/store/home_store.dart';

void setup() {
  GetIt.I.registerFactory(() => HomeStore());
  GetIt.I.registerFactory(() => BoardStore());
}
