import 'package:flutter_test/flutter_test.dart';
import 'package:game_of_queens/common/game_engine.dart';
import 'package:game_of_queens/models/possible_solutions.dart';

void main() {
  test('test all unique combinations for valid options', () {
    for (var solution in PossibleSolutions.possibleUniqueSolutions) {
      expect(GameEngine().isWinningGame(solution.queens), true);
    }
  });
  test('test all possible combinations for valid options', () {
    for (var solution in PossibleSolutions.possibleSolutions()) {
      expect(GameEngine().isWinningGame(solution.queens), true);
    }
  });
}
