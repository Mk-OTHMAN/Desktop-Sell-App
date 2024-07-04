import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CorporateTableHeader extends StatelessWidget {
  const CorporateTableHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // **************** remaining amount Container *******************
        Expanded(
          child: Container(
            width: 90.w,
            height: 40.h,
            decoration: const BoxDecoration(
                color: Colors.red,
                border: BorderDirectional(
                    top: BorderSide(
                        style: BorderStyle.solid, color: Colors.black),
                    bottom: BorderSide(
                        style: BorderStyle.solid, color: Colors.black),
                    end: BorderSide(
                        width: .5,
                        style: BorderStyle.solid,
                        color: Colors.black),
                    start: BorderSide(
                        width: .5,
                        style: BorderStyle.solid,
                        color: Colors.black))),
            child: Center(
              child: Text(
                'Remaining Amount',
                style: TextStyle(
                    decoration: TextDecoration.none,
                    fontSize: 5.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            ),
          ),
        ),
        // ***************  paid amount Container  ******************
        Expanded(
          child: Container(
            width: 90.w,
            height: 40.h,
            decoration: const BoxDecoration(
                color: Colors.green,
                border: BorderDirectional(
                    top: BorderSide(
                        style: BorderStyle.solid, color: Colors.black),
                    bottom: BorderSide(
                        style: BorderStyle.solid, color: Colors.black),
                    end: BorderSide(
                        width: .5,
                        style: BorderStyle.solid,
                        color: Colors.black),
                    start: BorderSide(
                        width: .5,
                        style: BorderStyle.solid,
                        color: Colors.black))),
            child: Center(
              child: Text(
                'Paid Amount',
                style: TextStyle(
                    decoration: TextDecoration.none,
                    fontSize: 5.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            ),
          ),
        ),
        // ***************   Amount Container  ******************
        Expanded(
          child: Container(
            width: 90.w,
            height: 40.h,
            decoration: const BoxDecoration(
                color: Colors.orange,
                border: BorderDirectional(
                    top: BorderSide(
                        style: BorderStyle.solid, color: Colors.black),
                    bottom: BorderSide(
                        style: BorderStyle.solid, color: Colors.black),
                    end: BorderSide(
                        width: .5,
                        style: BorderStyle.solid,
                        color: Colors.black),
                    start: BorderSide(
                        width: .5,
                        style: BorderStyle.solid,
                        color: Colors.black))),
            child: Center(
              child: Text(
                'Amount',
                style: TextStyle(
                    decoration: TextDecoration.none,
                    fontSize: 5.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            ),
          ),
        ),

        //  *****************  Date Container **************

        Expanded(
          child: Container(
            width: 90.w,
            height: 40.h,
            decoration: const BoxDecoration(
                color: Colors.blue,
                border: BorderDirectional(
                    top: BorderSide(
                        style: BorderStyle.solid, color: Colors.black),
                    bottom: BorderSide(
                        style: BorderStyle.solid, color: Colors.black),
                    end: BorderSide(
                        width: .5,
                        style: BorderStyle.solid,
                        color: Colors.black),
                    start: BorderSide(
                        width: .5,
                        style: BorderStyle.solid,
                        color: Colors.black))),
            child: Center(
              child: Text(
                'Date',
                style: TextStyle(
                    decoration: TextDecoration.none,
                    fontSize: 5.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            ),
          ),
        ),
        //******************* corporate  Name Container **************
        Expanded(
          child: Container(
            width: 90.w,
            height: 40.h,
            decoration: const BoxDecoration(
                color: Colors.white,
                border: BorderDirectional(
                    top: BorderSide(
                        style: BorderStyle.solid, color: Colors.black),
                    bottom: BorderSide(
                        style: BorderStyle.solid, color: Colors.black),
                    end: BorderSide(
                        width: .5,
                        style: BorderStyle.solid,
                        color: Colors.black),
                    start: BorderSide(
                        width: .5,
                        style: BorderStyle.solid,
                        color: Colors.black))),
            child: Center(
              child: Text(
                'Name',
                style: TextStyle(
                    decoration: TextDecoration.none,
                    fontSize: 5.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
