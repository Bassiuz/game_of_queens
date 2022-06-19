import 'package:game_of_queens/models/queen.dart';

class Solution {
  Solution({required this.queens});

  final List<Queen> queens;

  Solution mirrorSolution() {
    List<Queen> mirroredQueens = [];

    for (int i = 0; i < queens.length; i++) {
      mirroredQueens.add(
        Queen(
          id: queens[i].id,
          row: queens[i].row,
          column: 9 - queens[i].column,
        ),
      );
    }

    return Solution(queens: mirroredQueens);
  }

  Solution rotateSolution(Rotation rotation) {
    switch (rotation) {
      case Rotation.quarter:
        return _rotateQuarter(this);
      case Rotation.half:
        return _rotateHalf(this);
      case Rotation.threeQuarters:
        return _rotateThreeQuarters(this);
      default:
        return this;
    }
  }

  Solution _rotateQuarter(Solution solution) {
    List<Queen> rotatedQueens = [];

    for (int i = 0; i < queens.length; i++) {
      rotatedQueens.add(
        Queen(
          id: queens[i].id,
          column: queens[i].row,
          row: 9 - queens[i].column,
        ),
      );
    }

    return Solution(queens: rotatedQueens);
  }

  Solution _rotateHalf(Solution solution) {
    return _rotateQuarter(_rotateQuarter(solution));
  }

  Solution _rotateThreeQuarters(Solution solution) {
    return _rotateHalf(_rotateQuarter(solution));
  }
}

enum Rotation {
  quarter,
  half,
  threeQuarters,
}
