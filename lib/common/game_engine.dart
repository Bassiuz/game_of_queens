import 'package:game_of_queens/common/game_constants.dart';

import '../models/move.dart';
import '../models/move_type.dart';
import '../models/queen.dart';

class GameEngine {
  bool isWinningGame(List<Queen> placedQueens) {
    for (Queen queen in placedQueens) {
      if (GameEngine().tileIsCoveredTwice(
        row: queen.row,
        column: queen.column,
        placedQueens: placedQueens,
      )) return false;
    }

    return true;
  }

  List<Move> getPossibleMoves({
    required List<Queen> placedQueens,
  }) {
    List<Move> possibleMoves = [];

    for (int row = 1; row <= GameConstants.boardSize; row++) {
      for (int column = 1; column <= GameConstants.boardSize; column++) {
        if (GameEngine().tileIsCoveredTwice(
          row: row,
          column: column,
          placedQueens: placedQueens,
        )) continue;

        possibleMoves.add(Move(
          moveType: MoveType.place,
          row: row,
          column: column,
        ));
      }
    }

    return possibleMoves;
  }

  bool tileIsCoveredTwice({
    required int row,
    required int column,
    required List<Queen> placedQueens,
  }) {
    int twice = 2;

    return tileIsCoveredNTimes(
      row: row,
      column: column,
      placedQueens: placedQueens,
      n: twice,
    );
  }

  bool tileIsCoveredNTimes({
    required int row,
    required int column,
    required List<Queen> placedQueens,
    required int n,
  }) {
    if (placedQueens.where((element) => element.row == row).length >= n) {
      return true;
    }

    if (placedQueens.where((element) => element.column == column).length >= n) {
      return true;
    }

    if (placedQueens
            .where((element) => element.row + element.column == row + column)
            .length >=
        n) {
      return true;
    }

    if (placedQueens
            .where((element) => element.row - element.column == row - column)
            .length >=
        n) {
      return true;
    }

    return false;
  }
}
