import 'package:flutter/material.dart';
import 'package:game_of_queens/models/queen.dart';
import 'package:game_of_queens/widgets/piece_widgets/queen_piece.dart';
import 'package:provider/provider.dart';

import '../common/game_constants.dart';
import '../providers/board_state_provider.dart';

class QueenMenu extends StatelessWidget {
  const QueenMenu({Key? key, required this.scale}) : super(key: key);

  final double scale;

  @override
  Widget build(BuildContext context) {
    List<Queen> queens = Provider.of<BoardStateProvider>(context).placedQueens;

    return queens.length < GameConstants.boardSize
        ? QueenPiece(
            id: Provider.of<BoardStateProvider>(context).getNextQueenID(),
            scale: scale,
          )
        : Container();
  }
}
