import 'package:word_game/constants/enums.dart';
import 'package:word_game/constants/globals.dart';
import 'package:word_game/models/row_col_model.dart';

DragDirection getDragDirection(RowColModel newModel) {
  RowColModel preModel = draggedRowColModels.values.last;

  int rowDiff = (preModel.rowNo - newModel.rowNo);
  int colDiff = (preModel.colNo - newModel.colNo);
  int sumOffDifference = (newModel.rowNo - preModel.rowNo).abs() +
      (newModel.colNo - preModel.colNo).abs();
  if (rowDiff == 0) {
    // In single a row i.e borizontal
    if (colDiff < 0) {
      // R2L
      return DragDirection.horizontalL2R;
    } else {
      return DragDirection.horizontalR2L;
    }
  } else if (colDiff == 0) {
    // In single column
    if (rowDiff < 0) {
      // R2L
      return DragDirection.verticalT2B;
    } else {
      return DragDirection.verticalB2T;
    }
  } else if (rowDiff < 0 && colDiff < 0) {
    return DragDirection.diagonalTL2BR;
  } else if (rowDiff < 0 && colDiff > 0) {
    return DragDirection.diagonalTR2BL;
  } else if (rowDiff > 0 && colDiff < 0) {
    return DragDirection.diagonalBR2TL;
  } else {
    return DragDirection.diagonalBL2TR;
  }

  // if (sumOffDifference == 2) {
  //   return DragDirection.diagonal;
  // }
  // if (newModel.rowNo == preModel.rowNo) {
  //   return DragDirection.horizontal;
  // }
  // return DragDirection.vertical;
}
