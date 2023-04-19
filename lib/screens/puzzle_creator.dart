import 'dart:developer';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:word_game/constants/enums.dart';
import 'package:word_game/constants/extensions.dart';
import 'package:word_game/constants/globals.dart';
import 'package:word_game/main.dart';
import 'package:word_game/models/puzzle_model.dart';
import 'package:word_game/models/word_model.dart';
import 'package:word_game/providers/puzzle_creator_provider.dart';
import 'package:word_game/widgets/GridSelector.dart';
import 'package:word_game/widgets/letter_grid_widget.dart';
import 'package:word_game/widgets/words_chip_list.dart';
import 'package:word_game/widgets/words_stack.dart';

class PuzzleCreator extends StatefulWidget {
  PuzzleCreator({Key? key}) : super(key: key);

  @override
  State<PuzzleCreator> createState() => _PuzzleCreatorState();
}

class _PuzzleCreatorState extends State<PuzzleCreator> {
  PuzzleModel puzzleModel =
      PuzzleModel(rowNo: rowSelectedIndex + 5, colNo: colSelectedIndex + 5);
  TextEditingController controller = TextEditingController();
  late PuzzleCreatorProvider p;
  isKeyboardOpen(BuildContext context) {
    return MediaQuery.of(context).viewInsets.bottom > 0;
  }

  @override
  Widget build(BuildContext context) {
    p = Provider.of<PuzzleCreatorProvider>(context);
    log("isKeyboardOpen ${isKeyboardOpen(context)}");
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
          child: Stack(children: [
        SingleChildScrollView(child: column()),
        Positioned(
          bottom: 0,
          child: textField(),
        )
      ])),
    );
  }

  column() {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        const GridSelector(),
        // gap(),   gap(),
        LetterGridWidget(),
       
        // WordsStack(),
        WordsChipListWidget(),
        SizedBox(height: textfieldHeight+10,)
      ],
    );
  }

  double textfieldHeight = 60;
  textField() {
    return Container(
      width: w,
      height: textfieldHeight,
      margin: EdgeInsets.only(bottom: 8),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
            border: const OutlineInputBorder(),
            suffixIcon: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                    onPressed: () {
                      controller.clear();
                    },
                    icon: const Icon(
                      Icons.close,
                      color: Colors.red,
                    )),
                IconButton(
                    onPressed: () {
                      String word = controller.text.trim();
                      if (word.isNotEmpty &&
                          word.isValidAlphabet() &&
                          word.length <=
                              math.max(p.currentPuzzleModel.rowNo,
                                  p.currentPuzzleModel.colNo)) {
                        int length = p.currentPuzzleModel.words.length;
                        p.currentPuzzleModel.words.add(WordModel(
                            word: word,
                            wordOrientation: WordOrientation.horizontal,
                            offset: Offset(
                                (length % 2) * w * 0.5,
                                math.max(0, (200 / currentLetterBoxW).toInt()) *
                                    (length % 2) *
                                    currentLetterBoxW)));
                        p.updateUI();
                        controller.clear();
                        log("valid aphabet ${p.currentPuzzleModel.words.length}");
                      } else {
                        log("IN valid aphabet ${word.length} / max ${math.max(p.currentPuzzleModel.rowNo, p.currentPuzzleModel.colNo)} ");
                      }
                      FocusManager.instance.primaryFocus?.unfocus();
                    },
                    icon: const Icon(
                      Icons.check,
                      color: Colors.blue,
                    ))
              ],
            )),
      ),
    );
  }

  gap() {
    return Container(
      height: isKeyboardOpen(context)
          ? 10
          : ((h -
                          gridSelectorHheight -
                          textfieldHeight -
                          (p.currentPuzzleModel.rowNo /
                                  p.currentPuzzleModel.colNo) *
                              w -
                          40) *
                      0.5 -
                  40)
              .abs(),
    );
  }
}
