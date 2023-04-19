import 'package:flutter/material.dart';
import 'package:word_game/constants/enums.dart';
import 'package:word_game/models/item_model.dart';
import 'package:word_game/main.dart';
import 'package:word_game/models/row_col_model.dart';

double topPadding = 0;
double boxW = w / col;
double insideBoxW = boxW * (1 - boxInsidePaddingForGestureDetection);
int col = 8;
int row = 8;
double boxInsidePaddingForGestureDetection = 0.15;
double sidePaddingFactor = 0.05;
Offset currentPoint = Offset.zero;
List<ItemModel> items = [];
Map<String, RowColModel> draggedRowColModels = {};
bool isDiagonalDragged = false;

List<Offset> draggedActualPoints = [];
List<Offset> newShiftedActualPoints = [];
DragDirection dragDirection = DragDirection.none;

// Puzzle creator
int minimumRowColSize = 5;
int rowSelectedIndex = 0;
int colSelectedIndex = 0;
int rowValue = rowSelectedIndex + minimumRowColSize;
int colValue = colSelectedIndex + minimumRowColSize;

double currentLetterBoxW = 10;
