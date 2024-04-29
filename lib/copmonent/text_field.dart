import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_tools/bloc/add_product_cubit/add_product_cubit.dart';
import 'package:home_tools/bloc/add_product_cubit/add_product_state.dart';

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
    return BlocProvider(
      create: (context) => AddProductCubit(),
      child: BlocBuilder<AddProductCubit, AddProductState>(
          builder: (context, state) {
        AddProductCubit productCubit =
            BlocProvider.of<AddProductCubit>(context);
        return Column(
          children: [
            Text(
              textUpTextField,
              style: TextStyle(
                  fontSize: 7.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            SizedBox(
              width: width.w,
              height: height.h,
              child: TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Enter $textUpTextField';
                    }
                    return 'null';
                  },
                  controller: controller,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(left: 15.w),
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
      }),
    );
  }
}
