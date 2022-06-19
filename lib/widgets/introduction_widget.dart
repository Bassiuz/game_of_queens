import 'package:flutter/material.dart';
import 'package:game_of_queens/common/app_theme.dart';

class Introduction extends StatelessWidget {
  const Introduction({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Text('Game of Queens', style: AppTheme.titleStyle),
          Text('By: Bas de Vaan', style: AppTheme.subTitleStyle),
          Text(
            'In Game of Queens, you have to place your pieces on the board so that no two queens can attack each other. The game is over when all the queens are placed.',
            style: AppTheme.textStyle,
          ),
          Text(
            'You can place a queen by draging one to the board, or by clicking on a empty tile. If you need help, click on the help button and the next move will be done for you.',
            style: AppTheme.textStyle,
          ),
        ],
      ),
    );
  }
}
