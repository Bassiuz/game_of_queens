import 'dart:math';

import 'package:flutter/material.dart';
import 'package:game_of_queens/widgets/vertical_menu_pane.dart';

import 'horizontal_menu_pane.dart';

class MenuPanes extends StatelessWidget {
  const MenuPanes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    bool vertical = screenWidth < screenHeight;

    double boardSize = vertical ? screenWidth : screenHeight;
    double menuSize =
        vertical ? screenHeight - boardSize : screenWidth - boardSize;

    double minMenuSize = max(screenHeight, screenWidth) * 0.3;

    if (menuSize < minMenuSize) {
      menuSize = minMenuSize;
      boardSize = vertical ? screenWidth - menuSize : screenHeight - menuSize;
    }

    double scale = (boardSize / 130);

    return vertical
        ? VerticalMenuPane(scale: scale, boardSize: boardSize)
        : HorizontalMenuPane(
            scale: scale,
            boardSize: boardSize,
          );
  }
}
