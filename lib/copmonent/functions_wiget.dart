import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:giffy_dialog/giffy_dialog.dart';

class Functions {
//* ____ function for some height _____
  static SizedBox someSpaceHeight(double height) {
    return SizedBox(height: height.h);
  }

  //* ____ finction for some width ___
  static SizedBox someSpaceWidth(double width) {
    return SizedBox(width: width.w);
  }

//* ____ finction for AlertDialog ___
  static void gifShowDialog(String gifPath, BuildContext context, String title,
      String content, VoidCallback onPressed) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
              content: GiffyDialog.image(
            Image.asset(
              gifPath,
              height: 350.h,
              fit: BoxFit.cover,
            ),
            title: Text(
              title,
              style: const TextStyle(
                  color: Colors.black, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            content: Text(
              content,
              textAlign: TextAlign.center,
            ),
            actions: [
              Center(
                child: TextButton(
                  onPressed: onPressed,
                  child: const Text(
                    'OK',
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ));
        });
  }
}
