import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:giffy_dialog/giffy_dialog.dart';

class CustomWidget {
//* ____ function for some height _____
  static SizedBox someSpaceHeight(double height) {
    return SizedBox(height: height.h);
  }

  //* ____ finction for some width ___
  static SizedBox someSpaceWidth(double width) {
    return SizedBox(width: width.w);
  }

//* ____ function for AlertDialog _____
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
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 8.sp),
              textAlign: TextAlign.center,
            ),
            content: Text(
              content,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 4.sp,
                  color: Colors.black),
              textAlign: TextAlign.center,
            ),
            actions: [
              Center(
                child: TextButton(
                  onPressed: onPressed,
                  child: Text(
                    'OK',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 5.sp),
                  ),
                ),
              ),
            ],
          ));
        });
  }

  //*---------------- CircleAvatar
  static Widget pay(String path, VoidCallback processFunction) {
    return InkWell(
        overlayColor: const MaterialStatePropertyAll(Colors.transparent),
        onTap: processFunction,
        child: CircleAvatar(
          backgroundColor: Colors.transparent,
          radius: 50,
          child: Lottie.asset(
            path,
          ),
        ));
  }
}
