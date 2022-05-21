import 'package:flutter/material.dart';
import 'package:tictactoe/commons/commons.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return TTTScaffold(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Offstage(), // So that the logo is vertetically centered
              TTTLogo(),
              HomeActions(),
            ],
          ),
        ),
      ),
    );
  }
}

class HomeActions extends StatelessWidget {
  const HomeActions({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () => Navigator.of(context).pushNamed('/board'),
            child: const Text("NEW GAME"),
          ),
        ),
        TextButton(
          onPressed: () {},
          child: const Text('STATS'),
        ),
      ],
    );
  }
}
