import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_tools/constant/constant.dart';
import 'package:home_tools/copmonent/elevated_button.dart';
import 'package:home_tools/copmonent/functions_wiget.dart';
import 'package:home_tools/copmonent/text_field/number_text_field.dart';
import 'package:lottie/lottie.dart';

class EditAlertNumberOnly extends StatelessWidget {
  final TextEditingController editFieldController;

  final String textUpTextField;
  final String labelText;
  final String hintText;
  final double height;
  final double width;

  final VoidCallback onPressed;
  const EditAlertNumberOnly({
    super.key,
    required this.onPressed,
    required this.editFieldController,
    required this.textUpTextField,
    required this.labelText,
    required this.hintText,
    this.height = 30,
    this.width = 60,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Container(
          width: 250.w,
          height: 550.h,
          decoration: BoxDecoration(color: Constant.mainColor),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
            child: Column(children: [
              SizedBox(
                width: 140.w,
                height: 1.h,
                child: Lottie.asset(Constant.editDialogBackground,
                    fit: BoxFit.cover),
              ),
              // some space height ___
              Functions.someSpaceHeight(1),
              NumberTextField(
                controller: editFieldController,
                hintText: hintText,
                labelText: labelText,
                textUpTextField: textUpTextField,
                height: height.h,
                width: width.w,
              ),

              // some space height ___
              Functions.someSpaceHeight(375),
              // elevated button for add product
              CustomElevatedButton(
                buttonName: 'Update Now',
                buttonHeight: 25,
                buttonWidth: 40,
                buttonNameFontSize: 4,
                color: Colors.orange,
                onPressed: onPressed,
              )
            ]),
          )),
    );
  }
}
