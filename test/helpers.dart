import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:game_of_queens/providers/board_state_provider.dart';
import 'package:provider/provider.dart';

const testViewHeight = 1200.0;
const testViewWidth = 800.0;

final _defaultProviders = [
  ChangeNotifierProvider<BoardStateProvider>(
    create: (_) => BoardStateProvider(),
  ),
];

Future<void> renderWidget(
  WidgetTester tester,
  Widget child, {
  List<ChangeNotifierProvider>? customProviders,
}) async {
  tester.binding.window.physicalSizeTestValue =
      const Size(testViewHeight, testViewWidth);
  tester.binding.window.devicePixelRatioTestValue = 1.0;

  await tester.pumpWidget(
    TestAppWrapper(
      customProviders: customProviders ?? _defaultProviders,
      child: child,
    ),
  );

  await tester.pumpAndSettle();
}

class TestAppWrapper extends StatelessWidget {
  const TestAppWrapper({
    Key? key,
    required this.child,
    this.customProviders,
  }) : super(key: key);

  final Widget child;
  final List<ChangeNotifierProvider>? customProviders;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: GoldenWrapperWidget(
          customProviders: customProviders,
          child: child,
        ),
      ),
    );
  }
}

// ignore: prefer-single-widget-per-file
class GoldenWrapperWidget extends StatelessWidget {
  const GoldenWrapperWidget({
    super.key,
    this.customProviders,
    required this.child,
  });

  final Widget child;
  final List<ChangeNotifierProvider>? customProviders;

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: testViewHeight, width: testViewWidth, child: child);
  }
}
