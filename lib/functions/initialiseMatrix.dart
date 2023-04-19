import 'package:word_game/constants/globals.dart';
import 'package:word_game/models/item_model.dart';
import 'package:word_game/models/row_col_model.dart';
import 'package:word_game/screens/word_demo.dart';

void initialiseMatrix() {
  for (var i = 0; i < col; i++) {
    for (var j = 0; j < row; j++) {
      items.add(ItemModel(
          rowColModel: RowColModel(colNo: i, rowNo: j), text: "$i-$j"));
    }
  }
}
