import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CellComponent extends StatelessWidget {
  final String cellName;
  final double fontSize;
  final FontWeight fontWeight;
  final Color color;
  final double cellWidth;
  final double cellHeight;
  const CellComponent(
      {super.key,
      required this.cellName,
      this.fontSize = 5,
      this.fontWeight = FontWeight.bold,
      this.color = Colors.transparent,
      this.cellWidth = 120,
      this.cellHeight = 40});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: cellWidth.w,
      height: cellHeight.h,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.rectangle,
        border: const BorderDirectional(
            top: BorderSide.none,
            bottom: BorderSide(style: BorderStyle.solid, color: Colors.black),
            end: BorderSide(
                width: .5, style: BorderStyle.solid, color: Colors.black),
            start: BorderSide(
                width: .5, style: BorderStyle.solid, color: Colors.black)),
      ),
      child: Center(
        child: Text(
          cellName,
          style: TextStyle(
              decoration: TextDecoration.none,
              fontSize: fontSize.sp,
              fontWeight: fontWeight,
              color: Colors.black),
        ),
      ),
    );
  }
}
