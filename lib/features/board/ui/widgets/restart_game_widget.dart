import 'package:flutter/material.dart';

class RestartGameWidget extends StatelessWidget {
  const RestartGameWidget({
    Key? key,
    required this.isPlaying,
    required this.onRestartTap,
  }) : super(key: key);

  final VoidCallback onRestartTap;
  final bool isPlaying;

  @override
  Widget build(BuildContext context) {
    return AnimatedSize(
      duration: const Duration(milliseconds: 100),
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 100),
        child: !isPlaying
            ? SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: onRestartTap,
                        child: const Text('PLAY AGAIN'),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop(true);
                      },
                      child: const Text('NEW MATCH'),
                    ),
                  ],
                ),
              )
            : const Offstage(),
      ),
    );
  }
}
