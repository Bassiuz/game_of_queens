import 'package:flutter/material.dart';
import 'package:game_of_queens/widgets/piece_widgets/filled_board_tile.dart';
import 'package:provider/provider.dart';

import '../../common/sprite_constants.dart';
import '../../models/queen.dart';
import '../../providers/board_state_provider.dart';

class Chessboard extends StatelessWidget {
  const Chessboard({Key? key, required this.scale}) : super(key: key);

  final int scale;

  @override
  Widget build(BuildContext context) {
    List<Queen> queens = Provider.of<BoardStateProvider>(context).placedQueens;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        for (int i = 1; i <= 8; i++)
          Stack(
            children: [
              for (int j = 1; j <= 8; j++)
                Padding(
                  padding: EdgeInsets.only(
                      top: SpriteConstants.tileHeight * scale * j),
                  child: FilledBoardTile(
                    row: i,
                    column: j,
                    scale: scale,
                    queen: getQueenForPosition(
                        placedQueens: queens, row: i, column: j),
                  ),
                ),
            ],
          )
      ],
    );
  }

  Queen? getQueenForPosition(
      {required List<Queen> placedQueens,
      required int row,
      required int column}) {
    for (Queen queen in placedQueens) {
      if (queen.row == row && queen.column == column) {
        return queen;
      }
    }
    return null;
  }
}
