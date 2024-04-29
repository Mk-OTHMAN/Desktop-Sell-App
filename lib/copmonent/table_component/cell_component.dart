import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CellComponent extends StatelessWidget {
  final String cellName;
  final double fontSize;
  final FontWeight fontWeight;
  const CellComponent(
      {super.key,
      required this.cellName,
      this.fontSize = 5,
      this.fontWeight = FontWeight.bold});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120.w,
      height: 40.h,
      decoration: const BoxDecoration(
        shape: BoxShape.rectangle,
        border: BorderDirectional(
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
