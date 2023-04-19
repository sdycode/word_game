import 'package:word_game/models/word_model.dart';

class PuzzleModel {
  int rowNo;
  int colNo;
  List<WordModel> words =[];
  List<List<String>> letterMatrix;
  PuzzleModel({
    required this.rowNo,
    required this.colNo,

    this.letterMatrix = const [],
  });
}
