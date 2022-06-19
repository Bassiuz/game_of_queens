import 'package:game_of_queens/models/queen.dart';
import 'package:game_of_queens/models/solution.dart';

class PossibleSolutions {
  PossibleSolutions();

  static List<Solution> possibleSolutions() {
    List<Solution> solutions = [];
    for (var element in possibleUniqueSolutions) {
      solutions.add(element);
      solutions.add(element.mirrorSolution());
      solutions.add(element.rotateSolution(Rotation.quarter));
      solutions.add(element.rotateSolution(Rotation.quarter).mirrorSolution());
      solutions.add(element.rotateSolution(Rotation.half));
      solutions.add(element.rotateSolution(Rotation.half).mirrorSolution());
      solutions.add(element.rotateSolution(Rotation.threeQuarters));
      solutions
          .add(element.rotateSolution(Rotation.threeQuarters).mirrorSolution());
    }

    return solutions;
  }

  static final List<Solution> possibleUniqueSolutions = [
    Solution(queens: [
      Queen(id: 1, row: 1, column: 4),
      Queen(id: 2, row: 2, column: 7),
      Queen(id: 3, row: 3, column: 3),
      Queen(id: 4, row: 4, column: 8),
      Queen(id: 5, row: 5, column: 2),
      Queen(id: 6, row: 6, column: 5),
      Queen(id: 7, row: 7, column: 1),
      Queen(id: 8, row: 8, column: 6),
    ]),
    Solution(queens: [
      Queen(id: 1, row: 1, column: 5),
      Queen(id: 2, row: 2, column: 2),
      Queen(id: 3, row: 3, column: 4),
      Queen(id: 4, row: 4, column: 7),
      Queen(id: 5, row: 5, column: 3),
      Queen(id: 6, row: 6, column: 8),
      Queen(id: 7, row: 7, column: 6),
      Queen(id: 8, row: 8, column: 1),
    ]),
    Solution(queens: [
      Queen(id: 1, row: 1, column: 4),
      Queen(id: 2, row: 2, column: 2),
      Queen(id: 3, row: 3, column: 7),
      Queen(id: 4, row: 4, column: 3),
      Queen(id: 5, row: 5, column: 6),
      Queen(id: 6, row: 6, column: 8),
      Queen(id: 7, row: 7, column: 5),
      Queen(id: 8, row: 8, column: 1),
    ]),
    Solution(queens: [
      Queen(id: 1, row: 1, column: 4),
      Queen(id: 2, row: 2, column: 6),
      Queen(id: 3, row: 3, column: 8),
      Queen(id: 4, row: 4, column: 3),
      Queen(id: 5, row: 5, column: 1),
      Queen(id: 6, row: 6, column: 7),
      Queen(id: 7, row: 7, column: 5),
      Queen(id: 8, row: 8, column: 2),
    ]),
    Solution(queens: [
      Queen(id: 1, row: 1, column: 3),
      Queen(id: 2, row: 2, column: 6),
      Queen(id: 3, row: 3, column: 8),
      Queen(id: 4, row: 4, column: 1),
      Queen(id: 5, row: 5, column: 4),
      Queen(id: 6, row: 6, column: 7),
      Queen(id: 7, row: 7, column: 5),
      Queen(id: 8, row: 8, column: 2),
    ]),
    Solution(queens: [
      Queen(id: 1, row: 1, column: 5),
      Queen(id: 2, row: 2, column: 3),
      Queen(id: 3, row: 3, column: 8),
      Queen(id: 4, row: 4, column: 4),
      Queen(id: 5, row: 5, column: 7),
      Queen(id: 6, row: 6, column: 1),
      Queen(id: 7, row: 7, column: 6),
      Queen(id: 8, row: 8, column: 2),
    ]),
    Solution(queens: [
      Queen(id: 1, row: 1, column: 5),
      Queen(id: 2, row: 2, column: 7),
      Queen(id: 3, row: 3, column: 4),
      Queen(id: 4, row: 4, column: 1),
      Queen(id: 5, row: 5, column: 3),
      Queen(id: 6, row: 6, column: 8),
      Queen(id: 7, row: 7, column: 6),
      Queen(id: 8, row: 8, column: 2),
    ]),
    Solution(queens: [
      Queen(id: 1, row: 1, column: 4),
      Queen(id: 2, row: 2, column: 1),
      Queen(id: 3, row: 3, column: 5),
      Queen(id: 4, row: 4, column: 8),
      Queen(id: 5, row: 5, column: 6),
      Queen(id: 6, row: 6, column: 3),
      Queen(id: 7, row: 7, column: 7),
      Queen(id: 8, row: 8, column: 2),
    ]),
    Solution(queens: [
      Queen(id: 1, row: 1, column: 3),
      Queen(id: 2, row: 2, column: 6),
      Queen(id: 3, row: 3, column: 4),
      Queen(id: 4, row: 4, column: 1),
      Queen(id: 5, row: 5, column: 8),
      Queen(id: 6, row: 6, column: 5),
      Queen(id: 7, row: 7, column: 7),
      Queen(id: 8, row: 8, column: 2),
    ]),
    Solution(queens: [
      Queen(id: 1, row: 1, column: 6),
      Queen(id: 2, row: 2, column: 2),
      Queen(id: 3, row: 3, column: 7),
      Queen(id: 4, row: 4, column: 1),
      Queen(id: 5, row: 5, column: 4),
      Queen(id: 6, row: 6, column: 8),
      Queen(id: 7, row: 7, column: 5),
      Queen(id: 8, row: 8, column: 3),
    ]),
    Solution(queens: [
      Queen(id: 1, row: 1, column: 4),
      Queen(id: 2, row: 2, column: 7),
      Queen(id: 3, row: 3, column: 1),
      Queen(id: 4, row: 4, column: 8),
      Queen(id: 5, row: 5, column: 5),
      Queen(id: 6, row: 6, column: 2),
      Queen(id: 7, row: 7, column: 6),
      Queen(id: 8, row: 8, column: 3),
    ]),
    Solution(queens: [
      Queen(id: 1, row: 1, column: 6),
      Queen(id: 2, row: 2, column: 4),
      Queen(id: 3, row: 3, column: 7),
      Queen(id: 4, row: 4, column: 1),
      Queen(id: 5, row: 5, column: 8),
      Queen(id: 6, row: 6, column: 2),
      Queen(id: 7, row: 7, column: 5),
      Queen(id: 8, row: 8, column: 3),
    ]),
  ];
}
