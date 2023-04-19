import 'package:word_game/models/row_col_model.dart';

class ItemModel {
  RowColModel rowColModel;
  String text;
  bool isItemDragged;
  ItemModel({
    required this.rowColModel,
    required this.text,
     this.isItemDragged=false
  });
}
