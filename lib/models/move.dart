import 'move_type.dart';

class Move {
  Move({
    required this.moveType,
    required this.row,
    required this.column,
  });

  MoveType moveType;
  int row;
  int column;
}
