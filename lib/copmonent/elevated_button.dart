import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomElevatedButton extends StatelessWidget {
  final String buttonName;
  final VoidCallback onPressed;
  final double buttonNameFontSize;
  final double buttonWidth;
  final double buttonHeight;
  final Color color;
  const CustomElevatedButton(
      {super.key,
      required this.buttonName,
      required this.onPressed,
      this.buttonWidth = 20,
      this.buttonHeight = 20,
      this.color = Colors.blue,
      this.buttonNameFontSize = 5});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
          backgroundColor: MaterialStatePropertyAll(color),
          elevation: const MaterialStatePropertyAll(10),
          fixedSize:
              MaterialStatePropertyAll(Size(buttonWidth.w, buttonHeight.h))),
      child: Text(
        buttonName,
        style: TextStyle(
            fontSize: buttonNameFontSize.sp,
            fontWeight: FontWeight.bold,
            color: Colors.black),
      ),
    );
  }
}
