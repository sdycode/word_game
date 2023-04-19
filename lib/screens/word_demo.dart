import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:word_game/constants/enums.dart';
import 'package:word_game/constants/globals.dart';
import 'package:word_game/functions/findBoxIndexBasedOnGesturePos.dart';
import 'package:word_game/functions/getRowModelStringFromRowModel.dart';
import 'package:word_game/functions/initialiseMatrix.dart';
import 'package:word_game/models/item_model.dart';
import 'package:word_game/main.dart';
import 'package:word_game/models/row_col_model.dart';
import 'package:word_game/widgets/LetterBoxWidget.dart';
import 'package:word_game/widgets/ThickLinePainter.dart';

class WordDemo extends StatefulWidget {
  WordDemo({Key? key}) : super(key: key);

  @override
  State<WordDemo> createState() => _WordDemoState();
}

class _WordDemoState extends State<WordDemo> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    boxW = (w * (1 - sidePaddingFactor) / col).toInt().toDouble();
    insideBoxW = boxW * (1 - boxInsidePaddingForGestureDetection * 2);
    initialiseMatrix();
  }

  @override
  Widget build(BuildContext context) {
    double totalBoxH = boxW * row;
    double sidePaddingValue = (w - boxW * col) * 0.5;
    return Scaffold(
      body: Stack(children: [
        Positioned(
            top: (h - totalBoxH) * 0.5,
            left: sidePaddingValue,
            child: GestureDetector(
              onPanStart: (details) {
                draggedRowColModels.clear();
                draggedActualPoints.clear();
                newShiftedActualPoints.clear();
                dragDirection == DragDirection.none;
              },
              onPanUpdate: (d) {
                currentPoint = d.localPosition;
                draggedActualPoints.add(d.localPosition);
                RowColModel? rowColModel =
                    findBoxIndexBasedOnGesturePosInsidePadding(d.localPosition);
                if (rowColModel != null) {
                  draggedRowColModels.putIfAbsent(
                      getRowModelStringFromRowModel(rowColModel),
                      () => rowColModel);
                  // log("pos  ${draggedRowColModels.length} : ${rowColModel.colNo}/${rowColModel.rowNo} ${d.localPosition} ${boxW} /  $w / $totalBoxH");
                }

                setState(() {});
              },
              child: Container(
                width: w,
                height: totalBoxH,
                // color: Colors.green,
                child: Stack(children: [
                    Positioned(
                      left: currentPoint.dx,
                      top: currentPoint.dy,
                      child: FlutterLogo()),
                      ThickLinePaintWidget(),
                  // ...List.generate(
                  //     draggedActualPoints.length,
                  //     (i) => Positioned(
                  //         left: draggedActualPoints[i].dx,
                  //         top: draggedActualPoints[i].dy,
                  //         child: CircleAvatar(
                  //           radius: 2,
                  //           backgroundColor: Colors.red,
                  //         ))),
                  // ...List.generate(
                  //     newShiftedActualPoints.length,
                  //     (i) => Positioned(
                  //         left: newShiftedActualPoints[i].dx,
                  //         top: newShiftedActualPoints[i].dy,
                  //         child: CircleAvatar(
                  //           radius: 2,
                  //           backgroundColor: Colors.green,
                  //         ))),

                            ...List.generate(
                      items.length, (i) => LetterBoxWidget(i, items[i])),
              
                ]),
              ),
            ))
      ]),
    );
  }
}
