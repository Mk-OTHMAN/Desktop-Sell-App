import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EditProductTableHeader extends StatelessWidget {
  const EditProductTableHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // **************** customer price Container *******************
        Container(
          width: 90.w,
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
        // ***************  main price Container  ******************
        Container(
          width: 90.w,
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
        // ***************   product stock Container  ******************
        Container(
          width: 90.w,
          height: 40.h,
          decoration: const BoxDecoration(
              color: Colors.orange,
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
              'Stock',
              style: TextStyle(
                  decoration: TextDecoration.none,
                  fontSize: 5.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
          ),
        ),

        //  *****************  product name Container **************

        Container(
          width: 90.w,
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
              'product Name',
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
  }
}
