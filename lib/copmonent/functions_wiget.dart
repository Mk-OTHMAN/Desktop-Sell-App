import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_tools/constant/constant.dart';

class Functions {
//* ____ function for some height _____
  static SizedBox someSpaceHeight(double height) {
    return SizedBox(height: height.h);
  }

  //* ____ finction or some width ___
  static SizedBox someSpaceWidth(double width) {
    return SizedBox(width: width.w);
  }
}
