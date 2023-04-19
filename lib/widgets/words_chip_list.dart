import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:word_game/main.dart';
import 'package:word_game/providers/puzzle_creator_provider.dart';
import 'package:word_game/widgets/word_chip.dart';

class WordsChipListWidget extends StatelessWidget {
  const WordsChipListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PuzzleCreatorProvider p = Provider.of<PuzzleCreatorProvider>(context);

    return Container(
      width: w,
      height: 60,
      color: Color.fromARGB(255, 209, 167, 216),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
          itemCount: p.currentPuzzleModel.words.length,
          itemBuilder: (c, i) {
            return WordChip(i);
          }),
    );
  }
}
