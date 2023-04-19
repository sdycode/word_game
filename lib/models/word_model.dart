import 'package:flutter/material.dart';
import 'package:word_game/constants/enums.dart';
import 'package:word_game/models/row_col_model.dart';

class WordModel {
  String word;
  WordOrientation wordOrientation;
  bool placed;
  RowColModel rowColModel = RowColModel(rowNo: 0, colNo: 0);

  Offset offset;
  WordModel(
      {required this.word,
      required this.wordOrientation,
      this.placed = false,
      this.offset = Offset.zero});
}
