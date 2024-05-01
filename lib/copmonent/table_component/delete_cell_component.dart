import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_tools/constant/constant.dart';

class DeleteCellComponent extends StatelessWidget {
  final String cellName;
  final double fontSize;
  final FontWeight fontWeight;
  final Color color;
  final double cellWidth;
  final double cellHeight;
  final VoidCallback onPressed;
  const DeleteCellComponent(
      {super.key,
      required this.cellName,
      this.fontSize = 5,
      this.fontWeight = FontWeight.bold,
      this.color = Colors.transparent,
      this.cellWidth = 120,
      this.cellHeight = 40,
      required this.onPressed});

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
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Center(
              child: Text(
                cellName,
                style: TextStyle(
                    decoration: TextDecoration.none,
                    fontSize: fontSize.sp,
                    fontWeight: fontWeight,
                    color: Colors.black),
              ),
            ),

            //?======================================================================
            InkWell(
                overlayColor:
                    const MaterialStatePropertyAll(Colors.transparent),
                onTap: onPressed,
                child: Transform.scale(
                  scale: .6,
                  child: CircleAvatar(
                    backgroundColor: Colors.transparent,
                    child: Image.asset(
                      Constant.trashIcon,
                      fit: BoxFit.cover,
                    ),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
