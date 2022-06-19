import 'package:flutter/material.dart';
import 'package:game_of_queens/models/queen.dart';
import 'package:game_of_queens/widgets/piece_widgets/queen_piece.dart';
import 'package:provider/provider.dart';

import '../providers/board_state_provider.dart';

class QueenMenu extends StatelessWidget {
  const QueenMenu({Key? key, required this.scale}) : super(key: key);

  final int scale;

  @override
  Widget build(BuildContext context) {
    List<Queen> queens = Provider.of<BoardStateProvider>(context).placedQueens;

    return queens.length < 8
        ? QueenPiece(
            id: Provider.of<BoardStateProvider>(context).getNextQueenID(),
            scale: scale)
        : Container();
  }
}
