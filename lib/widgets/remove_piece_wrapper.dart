import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/queen.dart';
import '../providers/board_state_provider.dart';

class RemovePieceWrapper extends StatelessWidget {
  const RemovePieceWrapper({Key? key, required this.child}) : super(key: key);
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return DragTarget(onWillAccept: (data) {
      return true;
    }, onAccept: (int data) {
      Provider.of<BoardStateProvider>(context, listen: false)
          .removeQueen(Queen(id: data, row: 0, column: 0));
    }, builder: (BuildContext context, List<int?> candidateData,
        List<dynamic> rejectedData) {
      return child;
    });
  }
}
