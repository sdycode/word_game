import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:word_game/constants/enums.dart';
import 'package:word_game/constants/globals.dart';
import 'package:word_game/main.dart';

import 'package:word_game/models/word_model.dart';
import 'package:word_game/providers/puzzle_creator_provider.dart';
import 'package:word_game/widgets/GridSelector.dart';

class WordPositionedWidget extends StatelessWidget {
  final int i;
  final WordModel word;
  const WordPositionedWidget(
    this.i,
    this.word, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Offset localOffset = Offset.zero;
    PuzzleCreatorProvider p = Provider.of<PuzzleCreatorProvider>(context);
    double length = word.word.length * currentLetterBoxW;
    double wordBoxW = word.wordOrientation == WordOrientation.horizontal
        ? length
        : currentLetterBoxW;
    double wordBoxH = word.wordOrientation == WordOrientation.vertical
        ? length
        : currentLetterBoxW;
    return Positioned(
      left: word.offset.dx,
      top: word.offset.dy,
      // left: currentLetterBoxW * word.rowColModel.colNo,
      // top: currentLetterBoxW * word.rowColModel.rowNo,
      child: GestureDetector(
        onPanStart: (d) {
          localOffset = d.localPosition;
          log("panstart ${d.localPosition}");
        },
        onPanUpdate: (d) {
          word.offset = d.globalPosition
              .translate(0, -gridSelectorHheight - topPadding)
              .translate(localOffset.dx, localOffset.dy);
          p.updateUI();
        },
        onTap: () {
          if (word.wordOrientation == WordOrientation.horizontal) {
            word.wordOrientation = WordOrientation.vertical;
          } else {
            word.wordOrientation = WordOrientation.horizontal;
          }
          p.updateUI();
        },
        child: Container(
          width: wordBoxW,
          height: wordBoxH,
          color: Colors.primaries[i % Colors.primaries.length],
          child: Container(
              // child: word.wordOrientation == WordOrientation.horizontal
              //     ? Row(
              //         children: [],
              //       )
              //     : Column(),
              ),
        ),
      ),
    );
  }
}
