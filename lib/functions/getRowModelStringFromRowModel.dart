import 'package:word_game/models/row_col_model.dart';

String getRowModelStringFromRowModel(RowColModel rowColModel) {
  return rowColModel.rowNo.toString() + "_" + rowColModel.colNo.toString();
}
