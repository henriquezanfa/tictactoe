import 'package:flutter/material.dart';
import 'package:tictactoe/commons/commons.dart';
import 'package:tictactoe/core/routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToHome();
  }

  void _navigateToHome() {
    Future.delayed(const Duration(seconds: 2)).then((_) {
      Navigator.of(context).pushReplacementNamed(TTTRoutes.home);
    });
  }

  @override
  Widget build(BuildContext context) {
    return const TTTScaffold(
      child: Center(
        child: TTTLogo(),
      ),
    );
  }
}
