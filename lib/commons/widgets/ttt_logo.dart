import 'package:flutter/material.dart';
import 'package:tictactoe/commons/commons.dart';

class TTTLogo extends StatelessWidget {
  final double size;

  const TTTLogo({
    Key? key,
    this.size = 25,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colors = TTTColors();

    final textStyle = TextStyle(
      color: colors.text,
      fontSize: 25,
      fontWeight: FontWeight.bold,
    );

    final textStyleVariant = TextStyle(
      color: colors.primary,
      fontSize: 25,
      fontWeight: FontWeight.bold,
    );

    return Hero(
      tag: 'heero',
      child: Padding(
        padding: EdgeInsets.all(size),
        child: Container(
          decoration: BoxDecoration(
            color: colors.primary.withOpacity(0.1),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: colors.board,
              width: 5,
            ),
          ),
          child: GridView.count(
            padding: const EdgeInsets.all(2),
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 3,
            children: [
              TTTCell(
                content: Text('T', style: textStyleVariant),
                winnerCell: true,
              ),
              TTTCell(content: Text('I', style: textStyle)),
              TTTCell(content: Text('C', style: textStyle)),
              TTTCell(
                content: Text('T', style: textStyleVariant),
                winnerCell: true,
              ),
              TTTCell(content: Text('A', style: textStyle)),
              TTTCell(content: Text('C', style: textStyle)),
              TTTCell(
                content: Text('T', style: textStyleVariant),
                winnerCell: true,
              ),
              TTTCell(content: Text('O', style: textStyle)),
              TTTCell(content: Text('E', style: textStyle)),
            ],
          ),
        ),
      ),
    );
  }
}
