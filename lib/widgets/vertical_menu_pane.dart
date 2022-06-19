import 'package:flutter/material.dart';
import 'package:game_of_queens/widgets/help_button.dart';
import 'package:game_of_queens/widgets/introduction_widget.dart';
import 'package:game_of_queens/widgets/piece_widgets/chessboard.dart';
import 'package:game_of_queens/widgets/queen_menu.dart';
import 'package:game_of_queens/widgets/remove_piece_wrapper.dart';

import '../common/app_theme.dart';

class VerticalMenuPane extends StatelessWidget {
  const VerticalMenuPane({
    Key? key,
    required this.scale,
    required this.boardSize,
  }) : super(key: key);

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
          ),
        ),
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
            ),
          ),
        ),
      ],
    );
  }
}
