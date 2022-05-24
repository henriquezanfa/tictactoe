import 'package:flutter/material.dart';
import 'package:tictactoe/commons/commons.dart';
import 'package:tictactoe/domain/model/game_model.dart';

class BoardScreen extends StatefulWidget {
  final Game game;

  const BoardScreen({Key? key, required this.game}) : super(key: key);

  @override
  State<BoardScreen> createState() => _BoardScreenState();
}

class _BoardScreenState extends State<BoardScreen> {
  @override
  Widget build(BuildContext context) {
    return TTTScaffold(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ScoreWidget(game: widget.game),
              BoardWidget(),
              const Offstage(),
            ],
          ),
        ),
      ),
    );
  }
}

class ScoreWidget extends StatelessWidget {
  final Game game;

  const ScoreWidget({
    Key? key,
    required this.game,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colors = TTTColors();

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Theme.of(context).primaryColor,
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).colorScheme.secondary.withAlpha(100),
            blurRadius: 10.0,
            spreadRadius: 6.0,
            offset: const Offset(0, 0),
          ),
        ],
      ),
      padding: const EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.close, color: colors.text),
              Text(
                game.firstPlayer.name,
                style: TextStyle(
                  color: colors.text,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          Text(
            "VS",
            style: TextStyle(
              color: colors.text,
              fontWeight: FontWeight.bold,
              fontSize: 25,
            ),
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.circle_outlined,
                color: colors.text,
              ),
              Text(
                game.secondPlayer.name,
                style: TextStyle(
                  color: colors.text,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class BoardWidget extends StatelessWidget {
  final colors = TTTColors();

  BoardWidget({
    Key? key,
  }) : super(key: key);

  Widget xIcon({bool winner = false}) {
    return Icon(
      Icons.close,
      color: winner ? colors.primary : colors.text,
      size: 30,
    );
  }

  Widget oIcon({bool winner = false}) {
    return Icon(
      Icons.circle_outlined,
      color: winner ? colors.primary : colors.text,
      size: 30,
    );
  }

  @override
  Widget build(BuildContext context) {
    final boardColor = colors.board;

    return Container(
      decoration: BoxDecoration(
        color: colors.primary.withOpacity(0.1),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: boardColor,
          width: 5,
        ),
      ),
      child: GridView.count(
        padding: const EdgeInsets.all(2),
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        crossAxisCount: 3,
        children: [
          /// 1 line
          TTTCell(
            content: oIcon(winner: true),
            winnerCell: true,
          ),
          TTTCell(content: xIcon()),
          const TTTCell(),

          /// 2 line
          TTTCell(content: xIcon()),
          TTTCell(
            content: oIcon(winner: true),
            winnerCell: true,
          ),
          TTTCell(content: xIcon()),

          /// 3 line
          TTTCell(content: oIcon()),
          const TTTCell(),
          TTTCell(
            content: oIcon(winner: true),
            winnerCell: true,
          ),
        ],
      ),
    );
  }
}
