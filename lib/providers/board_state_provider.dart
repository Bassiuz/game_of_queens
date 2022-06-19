import 'package:flutter/material.dart';
import 'package:game_of_queens/common/game_engine.dart';
import 'package:game_of_queens/common/solutions_engine.dart';

import '../models/move.dart';

import '../models/move_type.dart';
import '../models/queen.dart';

class BoardStateProvider extends ChangeNotifier {
  List<Queen> placedQueens;

  BoardStateProvider({
    this.placedQueens = const [],
  });

  void placeQueen(Queen queen) {
    if (!_validQueenPlacement(queen)) return;

    if (placedQueens.where((element) => element.id == queen.id).isNotEmpty) {
      Queen existingQueen =
          placedQueens.where((element) => element.id == queen.id).first;
      placedQueens[placedQueens.indexOf(existingQueen)] = queen;
    } else {
      placedQueens = [...placedQueens, queen];
    }

    notifyListeners();
  }

  void removeQueen(Queen queen) {
    placedQueens =
        placedQueens.where((element) => element.id != queen.id).toList();
    notifyListeners();
  }

  int getNextQueenID() {
    for (int i = 1; i <= 8; i++) {
      if (placedQueens.where((element) => element.id == i).isEmpty) {
        return i;
      }
    }

    return -1;
  }

  void placeQueenAt({required int row, required int column}) {
    int id = getNextQueenID();
    Queen queen = Queen(id: id, row: row, column: column);
    placeQueen(queen);
  }

  void doSuggestedMove() {
    Move suggestedMove = SolutionsEngine().suggestMove(placedQueens);

    if (suggestedMove.moveType == MoveType.place) {
      placeQueenAt(row: suggestedMove.row, column: suggestedMove.column);
    } else if (suggestedMove.moveType == MoveType.remove) {
      Queen toBeRemovedQueen = placedQueens
          .where((element) =>
              element.row == suggestedMove.row &&
              element.column == suggestedMove.column)
          .first;
      removeQueen(toBeRemovedQueen);
    }
  }

  bool _validQueenPlacement(Queen queen) {
    if (queen.id < 0) return false;

    if (placedQueens
        .where((element) =>
            element.row == queen.row && element.column == queen.column)
        .isNotEmpty) {
      return false;
    }

    return true;
  }

  bool isWinningBoardState() {
    if (placedQueens.length < 8) return false;

    for (Queen queen in placedQueens) {
      if (GameEngine().tileIsCoveredTwice(
          row: queen.row,
          column: queen.column,
          placedQueens: placedQueens)) return false;
    }

    return true;
  }
}
