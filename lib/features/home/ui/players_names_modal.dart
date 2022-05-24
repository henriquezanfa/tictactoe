import 'package:flutter/material.dart';
import 'package:tictactoe/features/home/store/home_store.dart';

import 'enter_player_name.dart';

const firstPlayerRoute = 'first-player';
const secondPlayerRoute = 'second-player';

class PlayersNamesModal extends StatelessWidget {
  PlayersNamesModal({Key? key, required this.store}) : super(key: key);

  final HomeStore store;

  final _navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    // This navigator widget controlls the navigation inside the modal
    return Navigator(
      key: _navigatorKey,
      initialRoute: firstPlayerRoute,
      onGenerateRoute: (settings) {
        Widget child = const Offstage();

        if (settings.name == firstPlayerRoute) {
          child = EnterFirstPlayerName(
            store: store,
            onCloseTap: () => Navigator.of(context).pop(),
          );
        } else if (settings.name == secondPlayerRoute) {
          child = EnterSecondPlayerName(
            store: store,
            onNextTap: () => Navigator.of(context).pop(true),
          );
        }

        return MaterialPageRoute(builder: (_) => child);
      },
    );
  }
}
