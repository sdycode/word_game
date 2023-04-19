import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:word_game/constants/globals.dart';
import 'package:word_game/providers/puzzle_creator_provider.dart';
import 'package:word_game/providers/word_provider.dart';
import 'package:word_game/screens/puzzle_creator.dart';
import 'package:word_game/screens/word_demo.dart';

void main() {
  runApp(const MyApp());
}

double h = 50;
double w = 50;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => WordProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => PuzzleCreatorProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Builder(builder: (context) {
          w = MediaQuery.of(context).size.width;
          h = MediaQuery.of(context).size.height;
          topPadding = MediaQuery.of(context).viewPadding.top;
          log("topPadding $topPadding");
          return PuzzleCreator();
          WordDemo();
        }),
      ),
    );
  }
}
