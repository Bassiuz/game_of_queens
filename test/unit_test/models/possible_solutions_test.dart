import 'package:flutter_test/flutter_test.dart';
import 'package:game_of_queens/models/possible_solutions.dart';

void main() {
  test('test amount of possible solutions', () {
    // tecnically there are less solutions because 4 are double due to symetry.
    // However, we keep them in the list to make them appear equally as a possible solution.
    expect(PossibleSolutions.possibleSolutions().length, 12 * 8);
    expect(PossibleSolutions.possibleUniqueSolutions.length, 12);
  });
}
