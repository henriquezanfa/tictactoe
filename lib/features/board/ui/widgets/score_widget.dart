import 'package:flutter/material.dart';
import 'package:tictactoe/commons/constants/colors.dart';
import 'package:tictactoe/domain/model/player_model.dart';

class ScoreWidget extends StatelessWidget {
  final Player firstPlayer;
  final Player secondPlayer;

  const ScoreWidget({
    Key? key,
    required this.firstPlayer,
    required this.secondPlayer,
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
          SizedBox(
            width: 30,
            child: Text(
              '${firstPlayer.score}',
              style: TextStyle(
                color: colors.text,
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.close, color: colors.text),
              Text(
                firstPlayer.name,
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
                secondPlayer.name,
                style: TextStyle(
                  color: colors.text,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          SizedBox(
            width: 30,
            child: Text(
              '${secondPlayer.score}',
              style: TextStyle(
                color: colors.text,
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
