import 'package:flutter/material.dart';
import 'providers/board_state_provider.dart';
import 'widgets/menu_panes.dart';
import 'widgets/winners_overlay.dart';
import 'package:provider/provider.dart';

import 'widgets/background.dart';

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
              Background(),
              MenuPanes(),
              WinnersOverlay(),
            ],
          ),
        ),
      ),
    );
  }
}
