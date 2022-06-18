import 'package:flutter/material.dart';
import 'package:game_of_queens/widgets/piece_widgets/chessboard.dart';
import 'package:game_of_queens/widgets/piece_widgets/queen_piece.dart';
import 'package:provider/provider.dart';

import '../models/queen.dart';
import '../providers/board_state_provider.dart';

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

    double minMenuSize = 200;

    if (menuSize < minMenuSize) {
      menuSize = minMenuSize;
      boardSize = vertical ? screenWidth - menuSize : screenHeight - menuSize;
    }

    int scale = (boardSize / 120).floor();

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

  final int scale;
  final double boardSize;

  @override
  Widget build(BuildContext context) {
    List<Queen> queens = Provider.of<BoardStateProvider>(context).placedQueens;

    return Column(
      children: [
        Expanded(
            child: Container(
          color: Colors.blue,
          child: Row(
            children: [QueenPiece(id: queens.length + 1, scale: scale)],
          ),
        )),
        SizedBox(
          width: boardSize,
          height: boardSize,
          child: Container(
              color: Colors.red,
              child: Center(child: Chessboard(scale: scale))),
        ),
        Expanded(child: Container(color: Colors.blue)),
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

  final int scale;
  final double boardSize;
  final double menuSize;
  final double minMenuSize;

  @override
  Widget build(BuildContext context) {
    List<Queen> queens = Provider.of<BoardStateProvider>(context).placedQueens;

    return Row(
      children: [
        Expanded(
            child: Container(
          color: Colors.blue,
          child: Column(children: [
            Text('Scale $scale'),
            Text('BoardSize $boardSize'),
            Text('Minimal Menu Size $minMenuSize'),
            Text('Menu Size $menuSize'),
            QueenPiece(id: queens.length + 1, scale: scale),
          ]),
        )),
        SizedBox(
          width: boardSize,
          height: boardSize,
          child: Container(
              color: Colors.red,
              child: Center(child: Chessboard(scale: scale))),
        ),
        Expanded(child: Container(color: Colors.blue)),
      ],
    );
  }
}
