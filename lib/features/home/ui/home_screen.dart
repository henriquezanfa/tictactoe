import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:tictactoe/commons/commons.dart';
import 'package:tictactoe/core/routes.dart';
import 'package:tictactoe/domain/model/game_model.dart';
import 'package:tictactoe/domain/model/player_model.dart';
import 'package:tictactoe/features/home/store/home_store.dart';
import 'package:tictactoe/features/home/ui/players_names_modal.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final store = GetIt.I<HomeStore>();

  @override
  Widget build(BuildContext context) {
    return TTTScaffold(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Offstage(), // So that the logo is vertetically centered
              const TTTLogo(),
              HomeActions(store: store),
            ],
          ),
        ),
      ),
    );
  }
}

class HomeActions extends StatelessWidget {
  final HomeStore store;

  const HomeActions({
    Key? key,
    required this.store,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () => _onTapNewGame(context),
            child: const Text("NEW GAME"),
          ),
        ),
        TextButton(
          onPressed: () {},
          child: const Text('STATS'),
        ),
      ],
    );
  }

  void _onTapNewGame(BuildContext context) {
    showCupertinoModalBottomSheet(
      context: context,
      builder: (_) => PlayersNamesModal(store: store),
    ).then((value) {
      if (value) {
        final game = Game(
          Player(store.firstPlayerName!),
          Player(store.secondPlayerName!),
        );

        Navigator.of(context).pushNamed(TTTRoutes.board, arguments: game);
      }
      store.clear();
    });
  }
}
