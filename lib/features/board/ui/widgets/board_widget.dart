import 'package:flutter/material.dart';
import 'package:tictactoe/commons/constants/colors.dart';
import 'package:tictactoe/commons/widgets/ttt_cell.dart';
import 'package:tictactoe/domain/enum/indicator_enum.dart';
import 'package:tictactoe/domain/model/cell_model.dart';

typedef OnCellTapCallback = void Function(int index);

class BoardWidget extends StatefulWidget {
  final List<Cell> board;
  final OnCellTapCallback onCellTapCallback;

  const BoardWidget({
    Key? key,
    required this.board,
    required this.onCellTapCallback,
  }) : super(key: key);

  @override
  State<BoardWidget> createState() => _BoardWidgetState();
}

class _BoardWidgetState extends State<BoardWidget> {
  final colors = TTTColors();

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
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
        ),
        padding: const EdgeInsets.all(2),
        shrinkWrap: true,
        itemCount: widget.board.length,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (_, index) {
          final cell = widget.board[index];
          return GestureDetector(
            onTap: () => widget.onCellTapCallback(index),
            child: cell is EmptyCell
                ? const TTTCell()
                : TTTCell(
                    content: cell.player.indicator == IndicatorEnum.o
                        ? oIcon(winner: cell.winner)
                        : xIcon(winner: cell.winner),
                    winnerCell: cell.winner,
                  ),
          );
        },
      ),
    );
  }
}
