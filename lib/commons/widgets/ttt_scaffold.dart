import 'package:flutter/material.dart';
import 'package:tictactoe/commons/constants/colors.dart';

class TTTScaffold extends StatelessWidget {
  final Widget child;

  const TTTScaffold({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colors = TTTColors();

    return Scaffold(
      body: Container(
        child: child,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              colors.terciary,
              colors.secondary,
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
