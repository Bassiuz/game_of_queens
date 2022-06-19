import 'package:alchemist/alchemist.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:game_of_queens/widgets/background.dart';

import '../../helpers.dart';

void main() {
  group('Background Golden Tests', () {
    goldenTest(
      'renders correctly',
      fileName: 'golden_background',
      builder: () => GoldenTestGroup(
        children: [
          GoldenTestScenario(
            name: 'default widget',
            child: const GoldenWrapperWidget(child: Background()),
          ),
        ],
      ),
    );
  });
}
