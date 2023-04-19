import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:word_game/constants/enums.dart';
import 'package:word_game/constants/globals.dart';
import 'package:word_game/functions/getDragDirection.dart';
import 'package:word_game/models/row_col_model.dart';

RowColModel? findBoxIndexBasedOnGesturePos(Offset point) {
  double totalBoxH = boxW * row;

  int r = (point.dy / boxW).toInt();
  int c = (point.dx / boxW).toInt();

// boxInsidePaddingForGestureDetection
  return RowColModel(rowNo: r, colNo: c);
}

RowColModel? findBoxIndexBasedOnGesturePosInsidePadding(Offset point) {
  double totalBoxH = boxW * row;

  int r = (point.dy / boxW).toInt();
  int c = (point.dx / boxW).toInt();
  DragDirection currentDirection = DragDirection.none;
// DragDirection
  if (draggedRowColModels.length == 1) {
    dragDirection = getDragDirection(RowColModel(rowNo: r, colNo: c));
    currentDirection = dragDirection;
  } else if (draggedRowColModels.isNotEmpty) {
    currentDirection = getDragDirection(RowColModel(rowNo: r, colNo: c));
  }
  // log("dragDirection  ${draggedRowColModels.length} : $dragDirection /  curr ${currentDirection}");
  Offset newShiftedPoint = Offset(
      point.dx - boxInsidePaddingForGestureDetection * boxW - c * boxW,
      point.dy - boxInsidePaddingForGestureDetection * boxW - r * boxW);
  // log("shiftedpoint ${insideBoxW} : $newShiftedPoint /  ${point.dx % boxW} / ");
  // newShiftedActualPoints.add(newShiftedPoint);
  // double diff
  if (draggedRowColModels.length < 2) {
    dragDirection = currentDirection;
    if (draggedRowColModels.isEmpty) {
      if (newShiftedPoint.dx >= 0 &&
          newShiftedPoint.dy >= 0 &&
          newShiftedPoint.dx <= insideBoxW &&
          newShiftedPoint.dy <= insideBoxW) {
        return RowColModel(rowNo: r, colNo: c);
      } else {
        return null;
      }
    }

    int rowDiff = (draggedRowColModels.values.first.rowNo - r).abs();
    int colDiff = (draggedRowColModels.values.first.colNo - c).abs();
    int sumOffDifference = rowDiff + colDiff;

    // log("count ${draggedRowColModels.length} :  ${sumOffDifference}");
    if (rowDiff.abs() <= 1 &&
        colDiff.abs() <= 1 &&
        sumOffDifference.abs() <= 2) {
      if (newShiftedPoint.dx >= 0 &&
          newShiftedPoint.dy >= 0 &&
          newShiftedPoint.dx <= insideBoxW &&
          newShiftedPoint.dy <= insideBoxW) {
        return RowColModel(rowNo: r, colNo: c);
      }
    }
  } else {
    // log("dragDirection : $dragDirection / current $currentDirection");
    if (dragDirection == currentDirection) {
      int rowDiff = (draggedRowColModels.values.last.rowNo - r).abs();
      int colDiff = (draggedRowColModels.values.last.colNo - c).abs();

      if (rowDiff.abs() <= 1 && colDiff.abs() <= 1) {
        if (newShiftedPoint.dx >= 0 &&
            newShiftedPoint.dy >= 0 &&
            newShiftedPoint.dx <= insideBoxW &&
            newShiftedPoint.dy <= insideBoxW) {
          return RowColModel(rowNo: r, colNo: c);
        }
      }
    }
  }

  return null;
}
