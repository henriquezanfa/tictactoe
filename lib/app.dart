import 'package:flutter/material.dart';
import 'package:tictactoe/commons/constants/themes.dart';
import 'package:tictactoe/core/routes.dart';
import 'package:tictactoe/domain/model/game_model.dart';
import 'package:tictactoe/features/board/ui/board_screen.dart';
import 'package:tictactoe/features/home/ui/home_screen.dart';
import 'package:tictactoe/features/splash/splash_screen.dart';

class TicTacToeApp extends StatelessWidget {
  const TicTacToeApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppThemeData().themeData,
      onGenerateRoute: (settings) {
        Widget route = const Offstage(); // TODO: implement an error page
        switch (settings.name) {
          case TTTRoutes.splash:
            route = const SplashScreen();
            break;
          case TTTRoutes.home:
            route = const HomeScreen();
            break;
          case TTTRoutes.board:
            route = BoardScreen(game: settings.arguments as Game);
            break;
        }
        return MaterialPageRoute(builder: (context) => route);
      },
    );
  }
}
