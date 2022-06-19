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

      List<Queen> solutionQueens = randomSolution.queens;
      Queen randomQueen =
          solutionQueens[Random().nextInt(solutionQueens.length)];

      solutionQueens.remove(randomQueen);

      print(
          'queen 0 at row: ${solutionQueens[0].row} column: ${solutionQueens[0].column}');
      print(
          'queen 1 at row: ${solutionQueens[1].row} column: ${solutionQueens[1].column}');
      print(
          'queen 2 at row: ${solutionQueens[2].row} column: ${solutionQueens[2].column}');
      print(
          'queen 3 at row: ${solutionQueens[3].row} column: ${solutionQueens[3].column}');
      print(
          'queen 4 at row: ${solutionQueens[4].row} column: ${solutionQueens[4].column}');
      print(
          'queen 5 at row: ${solutionQueens[5].row} column: ${solutionQueens[5].column}');
      print(
          'queen 6 at row: ${solutionQueens[6].row} column: ${solutionQueens[6].column}');

      print(
          'remove queen at row: ${randomQueen.row} column: ${randomQueen.column}');

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

// this is an example of a once flakey edge case. This test helepd me fix logic error in the engine.
  test('suggest a winning last move for edgecase', () {
    List<Queen> solutionQueens = [
      Queen(id: 1, row: 1, column: 3),
      Queen(id: 1, row: 7, column: 7),
      Queen(id: 1, row: 8, column: 2),
      Queen(id: 1, row: 2, column: 6),
      Queen(id: 1, row: 6, column: 5),
      Queen(id: 1, row: 5, column: 1),
      Queen(id: 1, row: 3, column: 4),
    ];

    for (int i = 0; i < 1000; i++) {
      Move move = SolutionsEngine().suggestMove(solutionQueens);
      expect(move.row, 5);
      expect(move.column, 8);
      expect(move.moveType, MoveType.place);
    }
  });

  test('suggest removing a queen that is not in the solution', () {
    for (int i = 0; i < 1000; i++) {
      Solution randomSolution = PossibleSolutions.possibleSolutions()[
          Random().nextInt(PossibleSolutions.possibleSolutions().length)];

      List<Queen> solutionQueens = randomSolution.queens;
      Queen randomQueen =
          solutionQueens[Random().nextInt(solutionQueens.length)];

      solutionQueens.remove(randomQueen);

      List<int> rowNumbers = List.generate(8, (i) => i + 1);
      rowNumbers.remove(randomQueen.row);
      int rowNumber = rowNumbers[Random().nextInt(rowNumbers.length)];

      List<int> columnNumbers = List.generate(8, (i) => i + 1);
      columnNumbers.remove(randomQueen.column);
      int columnNumber = columnNumbers[Random().nextInt(columnNumbers.length)];

      solutionQueens
          .add(Queen(id: randomQueen.id, row: rowNumber, column: columnNumber));

      Move move = SolutionsEngine().suggestMove(solutionQueens);
      expect(move.row, rowNumber,
          reason:
              '''move expected: $rowNumber,$columnNumber for solution: ${randomSolution.queens[0].row},${randomSolution.queens[0].column}
              ${randomSolution.queens[1].row},${randomSolution.queens[1].column}
              ${randomSolution.queens[2].row},${randomSolution.queens[2].column}
              ${randomSolution.queens[3].row},${randomSolution.queens[3].column}
              ${randomSolution.queens[4].row},${randomSolution.queens[4].column}
              ${randomSolution.queens[5].row},${randomSolution.queens[5].column}
              ${randomSolution.queens[6].row},${randomSolution.queens[6].column}''');

      expect(move.column, columnNumber);
      expect(move.moveType, MoveType.remove);
    }
  });
}
