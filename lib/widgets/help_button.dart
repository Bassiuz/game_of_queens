import 'package:flutter/material.dart';
import '../common/app_theme.dart';
import 'package:provider/provider.dart';

import '../providers/board_state_provider.dart';

class HelpButton extends StatelessWidget {
  const HelpButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          Provider.of<BoardStateProvider>(context, listen: false)
              .doSuggestedMove();
        },
        child: Text('Help me a bit!', style: AppTheme.subTitleStyle));
  }
}
