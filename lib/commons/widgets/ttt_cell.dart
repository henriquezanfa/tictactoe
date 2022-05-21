import 'package:flutter/material.dart';
import 'package:tictactoe/commons/commons.dart';

class TTTCell extends StatelessWidget {
  const TTTCell({
    Key? key,
    this.content,
    this.cellColor,
    this.winnerCell = false,
  }) : super(key: key);

  final Widget? content;
  final Color? cellColor;
  final bool winnerCell;

  @override
  Widget build(BuildContext context) {
    final colors = TTTColors();

    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Container(
        child: Center(child: content),
        padding: const EdgeInsets.all(10),
        decoration: winnerCell
            ? BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: cellColor ?? colors.board,
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
              )
            : BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: cellColor ?? colors.board,
                gradient: LinearGradient(
                  colors: [
                    colors.primary,
                    cellColor ?? colors.board.withOpacity(0.8),
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
