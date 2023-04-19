import 'package:flutter/foundation.dart';
import 'package:word_game/constants/globals.dart';
import 'package:word_game/models/puzzle_model.dart';

class PuzzleCreatorProvider with ChangeNotifier {
  updateUI() {
    notifyListeners();
  }

  PuzzleModel currentPuzzleModel =
      PuzzleModel(rowNo: rowSelectedIndex+minimumRowColSize, colNo: colSelectedIndex + minimumRowColSize);
}
