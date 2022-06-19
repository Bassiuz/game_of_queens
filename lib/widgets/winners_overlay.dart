import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/board_state_provider.dart';

class WinnersOverlay extends StatefulWidget {
  const WinnersOverlay({Key? key}) : super(key: key);

  @override
  State<WinnersOverlay> createState() => _WinnersOverlayState();
}

class _WinnersOverlayState extends State<WinnersOverlay> {
  late ConfettiController _controller;
  @override
  void initState() {
    super.initState();
    _controller = ConfettiController(duration: const Duration(seconds: 10));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _controller.play();

    return Provider.of<BoardStateProvider>(context).isWinningBoardState()
        ? SizedBox.expand(
            child: Align(
              alignment: Alignment.center,
              child: ConfettiWidget(
                confettiController: _controller,
                blastDirectionality: BlastDirectionality.explosive,
                shouldLoop: false,
                colors: const [
                  Colors.green,
                  Colors.blue,
                  Colors.pink,
                  Colors.orange,
                  Colors.purple,
                ],
              ),
            ),
          )
        : Container();
  }
}
