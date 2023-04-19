

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:word_game/main.dart';
import 'package:word_game/providers/puzzle_creator_provider.dart';
import 'package:word_game/widgets/WordPositionedWidget.dart';

class WordsStack extends StatelessWidget {
  const WordsStack({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {    PuzzleCreatorProvider p
   = Provider.of<PuzzleCreatorProvider>(context);

    return Container(
      width: w,
      height: 200,
      child: Stack(children: [

        ...List.generate(p.currentPuzzleModel.words.length, (i) =>  Positioned(
          
         
          child: 
        WordPositionedWidget(i,p.currentPuzzleModel.words[i])
      // LettersInBoxesWidget(i)
        // Text(e.word)
        ))
      
      ]),
    );
  }
}