import 'package:flutter/material.dart';

import 'package:game_of_queens/widgets/piece_widgets/board_tile.dart';
import 'package:game_of_queens/widgets/piece_widgets/queen_piece.dart';

import '../../common/sprite_constants.dart';
import '../../models/queen.dart';

class FilledBoardTile extends StatelessWidget {
  FilledBoardTile({
    Key? key,
    required this.row,
    required this.column,
    required this.scale,
    this.queen,
    required this.color,
  }) : super(key: key);

  final int row;
  final int column;
  final int scale;
  final TileColor color;
  Queen? queen;

  @override
  Widget build(BuildContext context) {
    double queenPadding = (SpriteConstants.queenHeight -
            SpriteConstants.tileHeight +
            SpriteConstants.tilePlacementOffset) *
        scale;
    return Stack(
      children: [
        Padding(
          padding: EdgeInsets.only(top: queenPadding),
          child: BoardTile(
            row: row,
            column: column,
            scale: scale,
            color: color,
          ),
        ),
        if (queen != null)
          Positioned.fill(
            child: Align(
              alignment: Alignment.topCenter,
              child: QueenPiece(id: queen!.id, scale: scale),
            ),
          ),
      ],
    );
  }
}
