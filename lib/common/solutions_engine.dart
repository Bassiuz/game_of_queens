import 'dart:math';

import 'package:game_of_queens/models/possible_solutions.dart';

import '../models/move_type.dart';
import '../models/move.dart';
import '../models/queen.dart';
import '../models/solution.dart';

class SolutionsEngine {
  Move suggestMove(List<Queen> placedQueens) {
    int mostMatchingQueens = 0;
    List<Solution> mostMathingSolutions = [];

    // find the best matching sollutions
    for (Solution solution in PossibleSolutions.possibleSolutions()) {
      int matchingQueens = 0;
      for (Queen queen in solution.queens) {
        if (placedQueens
            .where((element) =>
                element.row == queen.row && element.column == queen.column)
            .isNotEmpty) {
          matchingQueens++;
        }
      }

      if (matchingQueens > mostMatchingQueens) {
        mostMatchingQueens = matchingQueens;
        mostMathingSolutions = [solution];
      } else if (matchingQueens == mostMatchingQueens) {
        mostMathingSolutions.add(solution);
      }
    }

    // select a solution to suggest
    Solution solution =
        mostMathingSolutions[Random().nextInt(mostMathingSolutions.length)];

    // check if we need to remove a piece or add a piece
    if (mostMatchingQueens == placedQueens.length) {
      // all queens match, so we can place a queen

      List<Queen> solutionQueens = solution.queens;
      //shuffle the solution queens so the suggestions aren't the same every time
      solutionQueens.shuffle();

      for (Queen queen in solutionQueens) {
        if (placedQueens.where((element) => element.row == queen.row).isEmpty) {
          return Move(
            row: queen.row,
            column: queen.column,
            moveType: MoveType.place,
          );
        }
      }
    } else {
      // find non matching queen and remove it

      //shuffle the solution queens so the suggestions aren't the same every time
      placedQueens.shuffle();

      for (Queen queen in placedQueens) {
        if (solution.queens
            .where((element) =>
                element.row == queen.row && element.column == queen.column)
            .isEmpty) {
          return Move(
            row: queen.row,
            column: queen.column,
            moveType: MoveType.remove,
          );
        }
      }
    }

    // something went wrong
    return Move(
      row: -1,
      column: -1,
      moveType: MoveType.place,
    );
  }
}
