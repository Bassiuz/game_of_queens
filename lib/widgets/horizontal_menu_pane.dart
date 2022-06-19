import 'package:flutter/material.dart';
import 'package:game_of_queens/widgets/help_button.dart';
import 'package:game_of_queens/widgets/introduction_widget.dart';
import 'package:game_of_queens/widgets/piece_widgets/chessboard.dart';
import 'package:game_of_queens/widgets/queen_menu.dart';
import 'package:game_of_queens/widgets/remove_piece_wrapper.dart';

import '../common/app_theme.dart';

class HorizontalMenuPane extends StatelessWidget {
  const HorizontalMenuPane({
    Key? key,
    required this.scale,
    required this.boardSize,
  }) : super(key: key);

  final double scale;
  final double boardSize;

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
                child: Column(children: [
                  QueenMenu(scale: scale),
                  const Spacer(),
                  const HelpButton(),
                ]),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
