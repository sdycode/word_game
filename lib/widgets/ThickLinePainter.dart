import 'package:flutter/material.dart';
import 'package:word_game/constants/globals.dart';

class ThickLinePaintWidget extends StatelessWidget {
  const ThickLinePaintWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.green.shade300.withAlpha(160),
      width: double.infinity,
      height: double.infinity,
      child: draggedRowColModels.length > 1
          ? CustomPaint(
              painter: _ThickLinePainter(),
            )
          : Container(),
    );
  }
}

class _ThickLinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // TODO: implement paint
    Path path = Path();
    Paint paint = Paint()
      ..strokeWidth = insideBoxW*1.4..style=PaintingStyle.stroke..strokeCap=StrokeCap.round
      ..color = Colors.red;

    path.moveTo(draggedRowColModels.values.first.colNo * boxW + boxW * 0.5,
        draggedRowColModels.values.first.rowNo * boxW + boxW * 0.5);
    path.lineTo(draggedRowColModels.values.last.colNo * boxW + boxW * 0.5,
        draggedRowColModels.values.last.rowNo * boxW + boxW * 0.5);

    // path.moveTo(0, 0);
    // path.lineTo(200, 250); path.lineTo(150, 350);
    // path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }
}
