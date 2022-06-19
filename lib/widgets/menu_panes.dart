import 'dart:math';

import 'package:flutter/material.dart';
import 'package:game_of_queens/widgets/help_button.dart';
import 'package:game_of_queens/widgets/introduction_widget.dart';
import 'package:game_of_queens/widgets/piece_widgets/chessboard.dart';
import 'package:game_of_queens/widgets/queen_menu.dart';
import 'package:game_of_queens/widgets/remove_piece_wrapper.dart';

import '../common/app_theme.dart';

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
            menuSize: menuSize,
            minMenuSize: minMenuSize);
  }
}

class VerticalMenuPane extends StatelessWidget {
  const VerticalMenuPane(
      {Key? key, required this.scale, required this.boardSize})
      : super(key: key);

  final double scale;
  final double boardSize;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            child: RemovePieceWrapper(
          child: Container(
            color: AppTheme.translucentBlack,
            child: const Padding(
              padding: EdgeInsets.all(AppTheme.menuPadding),
              child: Introduction(),
            ),
          ),
        )),
        SizedBox(
          width: boardSize,
          height: boardSize,
          child: Center(child: Chessboard(scale: scale)),
        ),
        Expanded(
            child: RemovePieceWrapper(
                child: Container(
          color: AppTheme.translucentBlack,
          child: Padding(
            padding: const EdgeInsets.all(AppTheme.menuPadding),
            child: Row(
              children: [
                QueenMenu(scale: scale),
                const Spacer(),
                const HelpButton(),
              ],
            ),
          ),
        ))),
      ],
    );
  }
}

class HorizontalMenuPane extends StatelessWidget {
  const HorizontalMenuPane(
      {Key? key,
      required this.scale,
      required this.boardSize,
      required this.menuSize,
      required this.minMenuSize})
      : super(key: key);

  final double scale;
  final double boardSize;
  final double menuSize;
  final double minMenuSize;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: RemovePieceWrapper(
          child: Container(
            height: double.infinity,
            color: AppTheme.translucentBlack,
            child: const Padding(
              padding: EdgeInsets.all(AppTheme.menuPadding),
              child: Introduction(),
            ),
          ),
        )),
        SizedBox(
          width: boardSize,
          height: boardSize,
          child: Center(child: Chessboard(scale: scale)),
        ),
        Expanded(
            child: RemovePieceWrapper(
                child: Container(
          color: AppTheme.translucentBlack,
          child: Padding(
            padding: const EdgeInsets.all(AppTheme.menuPadding),
            child: Column(children: [
              QueenMenu(scale: scale),
              const Spacer(),
              const HelpButton(),
            ]),
          ),
        ))),
      ],
    );
  }
}
