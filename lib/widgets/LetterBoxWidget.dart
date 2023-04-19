import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:word_game/constants/globals.dart';
import 'package:word_game/functions/getRowModelStringFromRowModel.dart';

import 'package:word_game/models/item_model.dart';
import 'package:word_game/models/row_col_model.dart';
import 'package:word_game/screens/word_demo.dart';

class LetterBoxWidget extends StatelessWidget {
  final int i;
  final ItemModel itemModel;
  const LetterBoxWidget(
    this.i,
    this.itemModel, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isItemDragged = false;
    // log("isItemDragged ${draggedRowColModels.values.length} / $i");
    if (draggedRowColModels
        .containsKey(getRowModelStringFromRowModel(itemModel.rowColModel))) {
      isItemDragged = true;
    }
    // draggedRowColModels.keys.forEach((e) {
    //   if (e == getRowModelStringFromRowModel(itemModel.rowColModel)) {
    //     isItemDragged = true;
    //   }
    //   log("inlist isItemDragged ${e}");
    // });
    // draggedRowColModels.values.map((e) {
    //   log("isItemDragged ${e}");
    //   if (e.colNo == itemModel.rowColModel.colNo &&
    //       itemModel.rowColModel.rowNo == e.rowNo) {
    //     isItemDragged = true;
    //   }
    // });
    return Positioned(
      left: itemModel.rowColModel.colNo * boxW,
      top: itemModel.rowColModel.rowNo * boxW,
      child: Container(
        width: boxW,
        height: boxW,
        // decoration: BoxDecoration(color: isItemDragged ? Colors.blue : null),
        child: Center(
          child: Container(
              width: insideBoxW,
              height: insideBoxW,
              // color: Colors.amber.shade100.withAlpha(50),
              child: Center(child: Text(itemModel.text))),
        ),
      ),
    );
  }
}
