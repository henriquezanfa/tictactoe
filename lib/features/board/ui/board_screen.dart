import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:tictactoe/commons/commons.dart';
import 'package:tictactoe/domain/model/game_model.dart';
import 'package:tictactoe/features/board/store/board_store.dart';
import 'package:tictactoe/features/board/ui/widgets/board_widget.dart';
import 'package:tictactoe/features/board/ui/widgets/game_result_widget.dart';
import 'package:tictactoe/features/board/ui/widgets/restart_game_widget.dart';
import 'package:tictactoe/features/board/ui/widgets/score_widget.dart';

class BoardScreen extends StatefulWidget {
  final Game game;

  const BoardScreen({Key? key, required this.game}) : super(key: key);

  @override
  State<BoardScreen> createState() => _BoardScreenState();
}

class _BoardScreenState extends State<BoardScreen> {
  final store = GetIt.I<BoardStore>();

  @override
  void initState() {
    super.initState();
    store.initGame(widget.game);
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        return TTTScaffold(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ScoreWidget(
                    firstPlayer: store.firstPlayer,
                    secondPlayer: store.secondPlayer,
                  ),
                  AnimatedSwitcher(
                    duration: const Duration(milliseconds: 100),
                    child: !store.isPlaying
                        ? GameResultWidget(
                            winner: store.winner,
                            isDraw: store.isDraw,
                          )
                        : const Offstage(),
                  ),
                  BoardWidget(
                    onCellTapCallback: store.makePlay,
                    board: store.board,
                  ),
                  RestartGameWidget(
                    isPlaying: store.isPlaying,
                    onRestartTap: store.restart,
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
