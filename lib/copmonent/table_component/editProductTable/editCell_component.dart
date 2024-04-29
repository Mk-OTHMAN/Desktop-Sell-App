import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EditCellComponent extends StatelessWidget {
  final String cellName;
  final double fontSize;
  final FontWeight fontWeight;
  final VoidCallback onPressed;

  const EditCellComponent({
    super.key,
    required this.cellName,
    required this.onPressed,
    this.fontSize = 5,
    this.fontWeight = FontWeight.bold,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 90.w,
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
        child: TextButton(
          onPressed: onPressed,
          child: Text(
            cellName,
            style: TextStyle(
                decoration: TextDecoration.none,
                fontSize: fontSize.sp,
                fontWeight: fontWeight,
                color: Colors.black),
          ),
        ),
      ),
    );
  }
}
