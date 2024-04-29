import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TableHeader extends StatelessWidget {
  const TableHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // **************** Model Name Container *******************
        Container(
          width: 120.w,
          height: 40.h,
          decoration: const BoxDecoration(
              color: Colors.green,
              border: BorderDirectional(
                  top:
                      BorderSide(style: BorderStyle.solid, color: Colors.black),
                  bottom:
                      BorderSide(style: BorderStyle.solid, color: Colors.black),
                  end: BorderSide(
                      width: .5, style: BorderStyle.solid, color: Colors.black),
                  start: BorderSide(
                      width: .5,
                      style: BorderStyle.solid,
                      color: Colors.black))),
          child: Center(
            child: Text(
              'Customer Price',
              style: TextStyle(
                  decoration: TextDecoration.none,
                  fontSize: 5.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
          ),
        ),
        // ***************  Model Quntaty Container  ******************
        Container(
          width: 120.w,
          height: 40.h,
          decoration: const BoxDecoration(
              color: Colors.red,
              border: BorderDirectional(
                  top:
                      BorderSide(style: BorderStyle.solid, color: Colors.black),
                  bottom:
                      BorderSide(style: BorderStyle.solid, color: Colors.black),
                  end: BorderSide(
                      width: .5, style: BorderStyle.solid, color: Colors.black),
                  start: BorderSide(
                      width: .5,
                      style: BorderStyle.solid,
                      color: Colors.black))),
          child: Center(
            child: Text(
              'Main Price',
              style: TextStyle(
                  decoration: TextDecoration.none,
                  fontSize: 5.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
          ),
        ),

        //  *****************  Color Item Container **************

        Container(
          width: 120.w,
          height: 40.h,
          decoration: const BoxDecoration(
              color: Colors.blue,
              border: BorderDirectional(
                  top:
                      BorderSide(style: BorderStyle.solid, color: Colors.black),
                  bottom:
                      BorderSide(style: BorderStyle.solid, color: Colors.black),
                  end: BorderSide(
                      width: .5, style: BorderStyle.solid, color: Colors.black),
                  start: BorderSide(
                      width: .5,
                      style: BorderStyle.solid,
                      color: Colors.black))),
          child: Center(
            child: Text(
              'Model Name',
              style: TextStyle(
                  decoration: TextDecoration.none,
                  fontSize: 5.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
          ),
        ),
      ],
    );
    ;
  }
}
