import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextField extends StatelessWidget {
  final double width;
  final double height;
  final String hintText;
  final String labelText;
  final String textUpTextField;
  final TextEditingController controller;
  const CustomTextField(
      {super.key,
      required this.controller,
      this.height = 50,
      this.width = 50,
      this.hintText = '',
      this.labelText = '',
      this.textUpTextField = ''});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          textUpTextField,
          style: TextStyle(
              fontSize: 7.sp, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        SizedBox(
          width: width.w,
          height: height.h,
          child: TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Enter $textUpTextField';
                }
              },
              autofocus: true,
              controller: controller,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.only(left: 5.w),
                border: const OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.grey,
                    style: BorderStyle.solid,
                  ),
                ),
                focusColor: Colors.purple,
                hintText: hintText,
                labelText: labelText,
              )),
        ),
      ],
    );
  }
}
