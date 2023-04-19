import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:word_game/constants/globals.dart';
import 'package:word_game/main.dart';
import 'package:word_game/models/puzzle_model.dart';
import 'package:word_game/providers/puzzle_creator_provider.dart';
import 'package:word_game/providers/word_provider.dart';

const double gridSelectorHheight = 100;

class GridSelector extends StatelessWidget {
  const GridSelector({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PuzzleCreatorProvider p = Provider.of<PuzzleCreatorProvider>(context);
    return Container(
      width: w,
      height: gridSelectorHheight,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            width: w * 0.16,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text("Row"),
                Text("Col"),
              ],
            ),
          ),
          ...List.generate(
              4,
              (i) => Container(
                    child: Column(
                      children: [
                        InkWell(
                          onTap: () {
                            rowSelectedIndex = i;
                            p.currentPuzzleModel.rowNo =
                                rowSelectedIndex + minimumRowColSize;
                            p.updateUI();
                          },
                          child: Container(
                              margin: EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: i == rowSelectedIndex
                                      ? Colors.red.shade800
                                      : Colors.pink.shade400),
                              height: 40,
                              width: (((1 - 0.16) * w) / 4) * 0.8,
                              child: Center(
                                  child: Text(
                                (i + minimumRowColSize).toString(),
                                style: TextStyle(color: Colors.white),
                              ))),
                        ),
                        InkWell(
                          onTap: () {
                            colSelectedIndex = i;
                            p.currentPuzzleModel.colNo =
                                colSelectedIndex + minimumRowColSize;
                            p.updateUI();
                          },
                          child: Container(
                              margin: EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: i == colSelectedIndex
                                      ? Colors.red.shade800
                                      : Colors.pink.shade400),
                              height: 40,
                              width: (((1 - 0.16) * w) / 4) * 0.8,
                              child: Center(
                                  child: Text(
                                (i + minimumRowColSize).toString(),
                                style: TextStyle(color: Colors.white),
                              ))),
                        )
                      ],
                    ),
                  ))
        ],
      ),
    );
  }

  _style(bool selected) {
    return ButtonStyle(
        backgroundColor: MaterialStateColor.resolveWith(
            (states) => selected ? Colors.red.shade700 : Colors.red.shade300));
  }
}
