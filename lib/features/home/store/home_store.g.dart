// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeStore on _HomeStore, Store {
  Computed<bool>? _$enableFirstPlayserNextButtonComputed;

  @override
  bool get enableFirstPlayserNextButton =>
      (_$enableFirstPlayserNextButtonComputed ??= Computed<bool>(
              () => super.enableFirstPlayserNextButton,
              name: '_HomeStore.enableFirstPlayserNextButton'))
          .value;
  Computed<bool>? _$enableSecondPlayerNextButtonComputed;

  @override
  bool get enableSecondPlayerNextButton =>
      (_$enableSecondPlayerNextButtonComputed ??= Computed<bool>(
              () => super.enableSecondPlayerNextButton,
              name: '_HomeStore.enableSecondPlayerNextButton'))
          .value;

  late final _$firstPlayerNameAtom =
      Atom(name: '_HomeStore.firstPlayerName', context: context);

  @override
  String? get firstPlayerName {
    _$firstPlayerNameAtom.reportRead();
    return super.firstPlayerName;
  }

  @override
  set firstPlayerName(String? value) {
    _$firstPlayerNameAtom.reportWrite(value, super.firstPlayerName, () {
      super.firstPlayerName = value;
    });
  }

  late final _$secondPlayerNameAtom =
      Atom(name: '_HomeStore.secondPlayerName', context: context);

  @override
  String? get secondPlayerName {
    _$secondPlayerNameAtom.reportRead();
    return super.secondPlayerName;
  }

  @override
  set secondPlayerName(String? value) {
    _$secondPlayerNameAtom.reportWrite(value, super.secondPlayerName, () {
      super.secondPlayerName = value;
    });
  }

  late final _$_HomeStoreActionController =
      ActionController(name: '_HomeStore', context: context);

  @override
  void setFirstPlayerName(String name) {
    final _$actionInfo = _$_HomeStoreActionController.startAction(
        name: '_HomeStore.setFirstPlayerName');
    try {
      return super.setFirstPlayerName(name);
    } finally {
      _$_HomeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSecondPlayerName(String name) {
    final _$actionInfo = _$_HomeStoreActionController.startAction(
        name: '_HomeStore.setSecondPlayerName');
    try {
      return super.setSecondPlayerName(name);
    } finally {
      _$_HomeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void clear() {
    final _$actionInfo =
        _$_HomeStoreActionController.startAction(name: '_HomeStore.clear');
    try {
      return super.clear();
    } finally {
      _$_HomeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
firstPlayerName: ${firstPlayerName},
secondPlayerName: ${secondPlayerName},
enableFirstPlayserNextButton: ${enableFirstPlayserNextButton},
enableSecondPlayerNextButton: ${enableSecondPlayerNextButton}
    ''';
  }
}
