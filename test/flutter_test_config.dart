import 'dart:async';

import 'package:alchemist/alchemist.dart';
import 'package:golden_toolkit/golden_toolkit.dart';

Future<void> testExecutable(FutureOr<void> Function() testMain) async {
  await loadAppFonts();

  return AlchemistConfig.runWithConfig(
    config: AlchemistConfig(
      platformGoldensConfig: PlatformGoldensConfig(platforms: <HostPlatform>{
        HostPlatform.macOS,
        HostPlatform.windows,
      }),
    ),
    run: testMain,
  );
}
