import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_tools/bloc/add_product_cubit/add_product_cubit.dart';
import 'package:home_tools/bloc/add_product_cubit/add_product_state.dart';
import 'package:home_tools/constant/constant.dart';
import 'package:home_tools/copmonent/elevated_button.dart';
import 'package:home_tools/copmonent/functions_wiget.dart';
import 'package:home_tools/copmonent/text_field/number_text_field.dart';
import 'package:home_tools/copmonent/text_field/text_field.dart';
import 'package:home_tools/routes/routes_name.dart';
import 'package:lottie/lottie.dart';

class AddAlertShowDialog extends StatelessWidget {
  final TextEditingController productNameController;
  final TextEditingController productStockController;
  final TextEditingController mainPriceController;
  final TextEditingController customerPriceController;
  const AddAlertShowDialog(
      {super.key,
      required this.productNameController,
      required this.productStockController,
      required this.mainPriceController,
      required this.customerPriceController});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Container(
          width: 250.w,
          height: 550.h,
          decoration: BoxDecoration(color: Constant.mainColor),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
            child: BlocProvider(
              create: (context) => AddProductCubit(),
              child: BlocBuilder<AddProductCubit, AddProductState>(
                  builder: (context, state) {
                AddProductCubit productCubit =
                    BlocProvider.of<AddProductCubit>(context);
                return Form(
                  key: productCubit.formKey,
                  child: Column(children: [
                    // some space height ___
                    Functions.someSpaceHeight(50),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        // Productname text field ___
                        CustomTextField(
                          controller: productNameController,
                          hintText: 'Enter Product Name',
                          labelText: 'Name',
                          textUpTextField: 'Product Name',
                        ),
                        // stock text field ___
                        NumberTextField(
                          controller: productStockController,
                          hintText: 'Enter Stock Quantity',
                          labelText: 'Quantity',
                          textUpTextField: 'Stock Quantity',
                        ),
                      ],
                    ),
                    Lottie.asset(Constant.lottieDishes,
                        height: 50.h, width: 50.w, fit: BoxFit.cover),
                    // some space height ___
                    Functions.someSpaceHeight(20),
                    //* ____ second row for text form field ____
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        // main price text field ___
                        NumberTextField(
                          controller: mainPriceController,
                          hintText: 'Enter Main Price',
                          labelText: 'Main Price',
                          textUpTextField: 'Main Price',
                        ),
                        // customer Price text field ___
                        NumberTextField(
                          controller: customerPriceController,
                          hintText: 'Enter Customer Price',
                          labelText: 'Customer Price',
                          textUpTextField: 'Customer Price',
                        ),
                      ],
                    ),
                    // some space height ___
                    Functions.someSpaceHeight(150),
                    // elevated button for add product
                    CustomElevatedButton(
                        buttonName: 'Add Product',
                        buttonHeight: 25,
                        buttonWidth: 40,
                        buttonNameFontSize: 4,
                        color: Colors.white,
                        onPressed: () {
                          if (productCubit.formKey.currentState!.validate()) {
                            productCubit.addProduct(
                                productNameController,
                                productStockController,
                                mainPriceController,
                                customerPriceController);
                            Functions.gifShowDialog(
                                Constant.catGif,
                                context,
                                'SUCCESS',
                                'Added New Product to Stock Successfully',
                                () => Navigator.popAndPushNamed(
                                    context, RoutesName.dashBoardScreen));
                          }
                        })
                  ]),
                );
              }),
            ),
          )),
    );
  }
}
