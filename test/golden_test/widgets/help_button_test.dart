import 'package:alchemist/alchemist.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:game_of_queens/widgets/help_button.dart';

import '../../helpers.dart';

void main() {
  group('Help Button Golden Tests', () {
    goldenTest(
      'renders correctly',
      fileName: 'golden_help_button',
      builder: () => GoldenTestGroup(
        children: [
          GoldenTestScenario(
            name: 'default widget',
            child: const GoldenWrapperWidget(child: HelpButton()),
          ),
        ],
      ),
    );
  });
}
