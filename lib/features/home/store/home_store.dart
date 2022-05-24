import 'package:mobx/mobx.dart';

part 'home_store.g.dart';

class HomeStore = _HomeStore with _$HomeStore;

abstract class _HomeStore with Store {
  @observable
  String? firstPlayerName;

  @observable
  String? secondPlayerName;

  @computed
  bool get enableFirstPlayserNextButton =>
      firstPlayerName != null && firstPlayerName!.isNotEmpty;

  @computed
  bool get enableSecondPlayerNextButton =>
      secondPlayerName != null && secondPlayerName!.isNotEmpty;

  @action
  void setFirstPlayerName(String name) => firstPlayerName = name;

  @action
  void setSecondPlayerName(String name) => secondPlayerName = name;

  @action
  void clear() {
    firstPlayerName = null;
    secondPlayerName = null;
  }
}

enum PlayerNameStep {
  firstPlayer,
  secondPlayer,
}
