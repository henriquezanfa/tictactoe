import 'package:flutter/material.dart';
import 'package:tictactoe/commons/constants/colors.dart';
import 'package:tictactoe/domain/model/player_model.dart';

class GameResultWidget extends StatelessWidget {
  final Player? winner;
  final bool isDraw;

  const GameResultWidget({
    Key? key,
    this.winner,
    this.isDraw = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colors = TTTColors();

    return AnimatedSize(
      duration: const Duration(milliseconds: 100),
      child: Container(
        child: isDraw ? const Text("TIE GAME") : Text("${winner?.name} wins"),
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: colors.board,
          boxShadow: [
            BoxShadow(
              color: colors.primary.withOpacity(0.8),
              blurRadius: 5.0,
              spreadRadius: 1.0,
              offset: const Offset(0, 0),
            ),
          ],
          gradient: LinearGradient(
            colors: [
              colors.text,
              colors.text.withOpacity(0.9),
            ],
            begin: const FractionalOffset(0.0, 0.0),
            end: const FractionalOffset(1.0, .0),
            stops: const [0.0, 1.0],
          ),
        ),
      ),
    );
  }
}
