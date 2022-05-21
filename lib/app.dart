import 'package:flutter/material.dart';
import 'package:tictactoe/commons/constants/themes.dart';
import 'package:tictactoe/features/board/board_screen.dart';
import 'package:tictactoe/features/home/home_screen.dart';
import 'package:tictactoe/features/splash/splash_screen.dart';

class TicTacToeApp extends StatelessWidget {
  const TicTacToeApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppThemeData().themeData,
      onGenerateRoute: (settings) {
        Widget route = Container(
          height: 50,
          width: 50,
          color: Colors.green,
        );
        switch (settings.name) {
          case '/':
            route = const SplashScreen();
            break;
          case '/home':
            route = const HomeScreen();
            break;
          case '/board':
            route = const BoardScreen();
            break;
        }
        return MaterialPageRoute(builder: (context) => route);
      },
    );
  }
}
