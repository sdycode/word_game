import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:word_game/providers/puzzle_creator_provider.dart';

class WordChip extends StatelessWidget {
  final int i;
  const WordChip(
    this.i, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PuzzleCreatorProvider p = Provider.of<PuzzleCreatorProvider>(context);
    return Container(
 padding: EdgeInsets.symmetric(horizontal: 8),      child: RawChip(
        padding: EdgeInsets.symmetric(horizontal: 4),
        
        label: Text(p.currentPuzzleModel.words[i].word),
        // onSelected: (value) {

        // },
        // selected: p.currentPuzzleModel.words[i].,
        onDeleted: () {
          p.currentPuzzleModel.words.removeAt(i);
          p.updateUI();
        },
        deleteIconColor: Colors.red,
        deleteIcon: Icon(Icons.close),
      ),
    );
  }
}
