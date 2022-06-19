import 'package:flutter/material.dart';
import 'package:game_of_queens/providers/board_state_provider.dart';
import 'package:game_of_queens/widgets/menu_panes.dart';
import 'package:game_of_queens/widgets/winners_overlay.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<BoardStateProvider>(
          create: (_) => BoardStateProvider(),
        ),
      ],
      child: MaterialApp(
        home: Scaffold(
          body: Stack(
            children: const [
              MenuPanes(),
              WinnersOverlay(),
            ],
          ),
        ),
      ),
    );
  }
}
