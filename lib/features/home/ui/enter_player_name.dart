import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:tictactoe/core/routes.dart';
import 'package:tictactoe/features/home/store/home_store.dart';

typedef UserNameCallback = void Function(String);

class EnterFirstPlayerName extends StatelessWidget {
  final HomeStore store;
  final VoidCallback onCloseTap;

  const EnterFirstPlayerName({
    Key? key,
    required this.store,
    required this.onCloseTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      return EnterPlayerNameWidget(
        onNameChanged: store.setFirstPlayerName,
        title: "What is the name of the player 1?",
        onTapNext: store.enableFirstPlayserNextButton
            ? () => Navigator.of(context).pushNamed(TTTRoutes.secondPlayerRoute)
            : null,
        leading: GestureDetector(
          onTap: onCloseTap,
          child: const Icon(Icons.close, color: Colors.black87),
        ),
      );
    });
  }
}

class EnterSecondPlayerName extends StatelessWidget {
  final HomeStore store;
  final VoidCallback onNextTap;

  const EnterSecondPlayerName({
    Key? key,
    required this.store,
    required this.onNextTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      return EnterPlayerNameWidget(
        onNameChanged: store.setSecondPlayerName,
        title: "And now, what is the name of the player 2?",
        onTapNext: store.enableSecondPlayerNextButton ? onNextTap : null,
        leading: GestureDetector(
          onTap: () => Navigator.of(context).pop(),
          child: const Icon(Icons.arrow_back_ios, color: Colors.black87),
        ),
      );
    });
  }
}

class EnterPlayerNameWidget extends StatelessWidget {
  const EnterPlayerNameWidget({
    Key? key,
    required this.title,
    required this.leading,
    required this.onNameChanged,
    this.onTapNext,
  }) : super(key: key);

  final String title;
  final VoidCallback? onTapNext;
  final Widget leading;
  final UserNameCallback onNameChanged;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: leading,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Text(
              title,
              style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            TextFormField(
              style: const TextStyle(fontSize: 18),
              onChanged: onNameChanged,
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: onTapNext,
                child: const Text('NEXT'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
