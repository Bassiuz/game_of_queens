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
    Solution randomSolution = PossibleSolutions.possibleSolutions()[
        Random().nextInt(PossibleSolutions.possibleSolutions().length)];

    List<Queen> solutionQueens = randomSolution.queens;
    Queen randomQueen = solutionQueens[Random().nextInt(solutionQueens.length)];

    solutionQueens.remove(randomQueen);

    Move move = SolutionsEngine().suggestMove(solutionQueens);
    expect(move.row, randomQueen.row);
    expect(move.column, randomQueen.column);
    expect(move.moveType, MoveType.place);
  });

  test('suggest removing a queen that is not in the solution', () {
    Solution randomSolution = PossibleSolutions.possibleSolutions()[
        Random().nextInt(PossibleSolutions.possibleSolutions().length)];

    List<Queen> solutionQueens = randomSolution.queens;
    Queen randomQueen = solutionQueens[Random().nextInt(solutionQueens.length)];

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
    expect(move.row, rowNumber);
    expect(move.column, columnNumber);
    expect(move.moveType, MoveType.remove);
  });
}
