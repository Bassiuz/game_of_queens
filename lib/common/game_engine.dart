import '../models/queen.dart';

class GameEngine {
  bool isWinningGame(List<Queen> placedQueens) {
    for (Queen queen in placedQueens) {
      if (GameEngine().tileIsCoveredTwice(
          row: queen.row,
          column: queen.column,
          placedQueens: placedQueens)) return false;
    }
    return true;
  }

  bool tileIsCoveredTwice(
      {required int row,
      required int column,
      required List<Queen> placedQueens}) {
    if (placedQueens.where((element) => element.row == row).length > 1) {
      return true;
    }

    if (placedQueens.where((element) => element.column == column).length > 1) {
      return true;
    }

    if (placedQueens
            .where((element) => element.row + element.column == row + column)
            .length >
        1) {
      return true;
    }

    if (placedQueens
            .where((element) => element.row - element.column == row - column)
            .length >
        1) {
      return true;
    }

    return false;
  }
}
