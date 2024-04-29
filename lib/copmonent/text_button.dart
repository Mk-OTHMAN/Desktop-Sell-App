import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextButton extends StatelessWidget {
  final String textButtonName;
  final VoidCallback onPressed;
  final double buttonNameFontSize;
  const CustomTextButton(
      {super.key,
      required this.textButtonName,
      required this.onPressed,
      this.buttonNameFontSize = 5});

  @override
  Widget build(BuildContext context) {
    return TextButton(
        style: const ButtonStyle(
            overlayColor: MaterialStatePropertyAll(Colors.transparent)),
        onPressed: onPressed,
        child: Text(
          textButtonName,
          style: TextStyle(
              fontSize: buttonNameFontSize.sp,
              fontWeight: FontWeight.bold,
              color: Colors.black),
        ));
  }
}
