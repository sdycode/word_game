import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:word_game/constants/globals.dart';
import 'package:word_game/main.dart';
import 'package:word_game/providers/puzzle_creator_provider.dart';
import 'package:word_game/widgets/WordPositionedWidget.dart';

class LetterGridWidget extends StatelessWidget {
  const LetterGridWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PuzzleCreatorProvider p = Provider.of<PuzzleCreatorProvider>(context);
    currentLetterBoxW = w / p.currentPuzzleModel.colNo;
    return Container(
      width: w,
      height: (p.currentPuzzleModel.rowNo / p.currentPuzzleModel.colNo) * w+200,
      color: Colors.orange.shade200,
      child: Stack(children: [
        
        ...List.generate(p.currentPuzzleModel.words.length,
            (i) => WordPositionedWidget(i, p.currentPuzzleModel.words[i]))
      ]),
    );
  }
}
