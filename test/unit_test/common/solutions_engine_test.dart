import 'dart:math';

import 'package:flutter_test/flutter_test.dart';
import 'package:game_of_queens/common/solutions_engine.dart';
import 'package:game_of_queens/models/move.dart';
import 'package:game_of_queens/models/move_type.dart';
import 'package:game_of_queens/models/possible_solutions.dart';
import 'package:game_of_queens/models/queen.dart';
import 'package:game_of_queens/models/solution.dart';

void main() {
  // while the randomness of these tests can in theory create flakyness, it is unlikely to
  // do so, because the solution is deterministic.
  // This is a good test to make sure the engine is working correctly.
  // Whenever this test turns up flakey, we can locally reproduce it a lot to find which move ends up being flakey and fix that specfic case.
  // Looping through all moves and checking them will slow down test package too much.
  test('suggest a winning last move', () {
    for (int i = 0; i < 1000; i++) {
      Solution randomSolution = PossibleSolutions.possibleUniqueSolutions[
          Random().nextInt(PossibleSolutions.possibleUniqueSolutions.length)];

      List<Queen> solutionQueens = [...randomSolution.queens];
      Queen randomQueen =
          solutionQueens[Random().nextInt(solutionQueens.length)];

      solutionQueens.remove(randomQueen);
      Move move = SolutionsEngine().suggestMove(solutionQueens);
      expect(move.row, randomQueen.row,
          reason:
              '''move expected: ${randomQueen.row},${randomQueen.column} for solution: ${randomSolution.queens[0].row},${randomSolution.queens[0].column}
              ${randomSolution.queens[1].row},${randomSolution.queens[1].column}
              ${randomSolution.queens[2].row},${randomSolution.queens[2].column}
              ${randomSolution.queens[3].row},${randomSolution.queens[3].column}
              ${randomSolution.queens[4].row},${randomSolution.queens[4].column}
              ${randomSolution.queens[5].row},${randomSolution.queens[5].column}
              ${randomSolution.queens[6].row},${randomSolution.queens[6].column}''');
      expect(move.column, randomQueen.column);
      expect(move.moveType, MoveType.place);
    }
  });

  test('suggest removing a queen that is not in the solution', () {
    for (int i = 0; i < 1000; i++) {
      Solution randomSolution = PossibleSolutions.possibleSolutions()[
          Random().nextInt(PossibleSolutions.possibleSolutions().length)];

      List<Queen> solutionQueens = [...randomSolution.queens];

      int index = Random().nextInt(solutionQueens.length);
      Queen randomQueen = solutionQueens[index];

      solutionQueens.removeAt(index);

      expect(solutionQueens.contains(randomQueen), false);

      solutionQueens.shuffle();

      int rowNumber = solutionQueens[0].row;
      int columnNumber = solutionQueens[1].column;

      Queen toBeRemovedQueen =
          Queen(id: 9, row: rowNumber, column: columnNumber);
      solutionQueens.add(toBeRemovedQueen);

      Move move = SolutionsEngine().suggestMove(solutionQueens);
      expect(move.row, rowNumber,
          reason:
              '''move expected: $rowNumber,$columnNumber for solution: ${randomSolution.queens[0].row},${randomSolution.queens[0].column}
              ${randomSolution.queens[1].row},${randomSolution.queens[1].column}
              ${randomSolution.queens[2].row},${randomSolution.queens[2].column}
              ${randomSolution.queens[3].row},${randomSolution.queens[3].column}
              ${randomSolution.queens[4].row},${randomSolution.queens[4].column}
              ${randomSolution.queens[5].row},${randomSolution.queens[5].column}
              ${randomSolution.queens[6].row},${randomSolution.queens[6].column}
              ${randomSolution.queens[7].row},${randomSolution.queens[7].column}''');

      expect(move.column, columnNumber);
      expect(move.row, rowNumber);
      expect(move.moveType, MoveType.remove);
    }
  });
}
