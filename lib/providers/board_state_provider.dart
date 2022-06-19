import 'package:flutter/material.dart';

import '../models/queen.dart';

class BoardStateProvider extends ChangeNotifier {
  List<Queen> placedQueens;

  BoardStateProvider({
    this.placedQueens = const [],
  });

  void placeQueen(Queen queen) {
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
}
