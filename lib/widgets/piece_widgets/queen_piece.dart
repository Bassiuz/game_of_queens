import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../common/sprite_constants.dart';

class QueenPiece extends StatelessWidget {
  const QueenPiece({Key? key, required this.scale, required this.id})
      : super(key: key);

  final int scale;
  final int id;

  @override
  Widget build(BuildContext context) {
    return Draggable<int>(
      data: id,
      childWhenDragging: Container(),
      feedback: SvgPicture.asset(
        'assets/queen.svg',
        semanticsLabel: 'Queen',
        height: SpriteConstants.queenHeight * scale,
      ),
      child: SvgPicture.asset(
        'assets/queen.svg',
        semanticsLabel: 'Queen',
        height: SpriteConstants.queenHeight * scale,
      ),
    );
  }
}
