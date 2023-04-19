import 'package:flutter/material.dart';

class SingleLetterBox extends StatelessWidget {
  final String letter;
  final double size;
  const SingleLetterBox({
    Key? key,
    required this.letter,
    required this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(4),
      width: size,
      height: size,
decoration: BoxDecoration(
                border: Border.all(), borderRadius: BorderRadius.circular(8)),
                child: Center(child: Text(letter),),

    );
  }
}
