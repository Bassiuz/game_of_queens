import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:game_of_queens/common/sprite_constants.dart';
import 'package:game_of_queens/models/queen.dart';
import 'package:provider/provider.dart';

import '../../providers/board_state_provider.dart';

class BoardTile extends StatelessWidget {
  const BoardTile(
      {Key? key,
      required this.scale,
      required this.color,
      required this.row,
      required this.column})
      : super(key: key);

  final double scale;
  final TileColor color;
  final int row;
  final int column;

  @override
  Widget build(BuildContext context) {
    return DragTarget(onWillAccept: (data) {
      return true;
    }, onAccept: (int data) {
      Provider.of<BoardStateProvider>(context, listen: false)
          .placeQueen(Queen(id: data, row: row, column: column));
    }, builder: (BuildContext context, List<int?> candidateData,
        List<dynamic> rejectedData) {
      return GestureDetector(
        onTap: () {
          Provider.of<BoardStateProvider>(context, listen: false)
              .placeQueenAt(row: row, column: column);
        },
        child: SvgPicture.asset(
          color.asset,
          height: SpriteConstants.tileHeight * scale,
        ),
      );
    });
  }
}

enum TileColor {
  white('assets/white_tile.svg'),
  black('assets/black_tile.svg'),
  whiteMarked('assets/white_tile_marked.svg'),
  blackMarked('assets/black_tile_marked.svg');

  const TileColor(this.asset);

  final String asset;
}
