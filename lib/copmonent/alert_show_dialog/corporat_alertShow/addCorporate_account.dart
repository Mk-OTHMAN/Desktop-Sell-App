import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_tools/bloc/corporate/corporate_cubit/corporate_cubit.dart';
import 'package:home_tools/bloc/corporate/corporate_cubit/corporate_state.dart';
import 'package:home_tools/constant/constant.dart';
import 'package:home_tools/copmonent/elevated_button.dart';
import 'package:home_tools/copmonent/functions_wiget.dart';
import 'package:home_tools/copmonent/text_field/number_text_field.dart';
import 'package:home_tools/copmonent/text_field/text_field.dart';
import 'package:home_tools/routes/routes_name.dart';
import 'package:lottie/lottie.dart';

class CorporateAddAlertShow extends StatelessWidget {
  final TextEditingController corporateNameController;
  final TextEditingController corporateAccountController;

  const CorporateAddAlertShow({
    super.key,
    required this.corporateNameController,
    required this.corporateAccountController,
  });

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();
    CorporateCubit corporateCubit = BlocProvider.of<CorporateCubit>(context);
    return BlocBuilder<CorporateCubit, CorporateState>(
      builder: (context, state) {
        return AlertDialog(
            content: Container(
                width: 250.w,
                height: 550.h,
                decoration: BoxDecoration(color: Constant.mainColor),
                child: Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
                    child: Form(
                      key: globalFormKey,
                      child: Column(children: [
                        // some space height ___
                        CustomWidget.someSpaceHeight(50),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            // Productname text field ___
                            CustomTextField(
                              controller: corporateNameController,
                              hintText: 'Enter Corporate Name',
                              labelText: 'Name',
                              textUpTextField: 'Corporate Name',
                            ),
                            //* ------------------------------
                            // stock text field ___
                            NumberTextField(
                              controller: corporateAccountController,
                              hintText: 'Enter Forward Amount',
                              labelText: 'Amount',
                              textUpTextField: 'Forward Amount',
                            ),
                          ],
                        ),
                        //* -----------------------------------
                        Lottie.asset(Constant.addUserLottie,
                            height: 20.h, width: 50.w, fit: BoxFit.cover),
                        // some space height ___
                        CustomWidget.someSpaceHeight(20),
                        //* ____ second row for text form field ____

                        // some space height ___
                        CustomWidget.someSpaceHeight(200),
                        // elevated button for add product
                        CustomElevatedButton(
                            buttonName: 'Create Account',
                            buttonHeight: 25,
                            buttonWidth: 45,
                            buttonNameFontSize: 4,
                            color: Colors.white,
                            onPressed: () {
                              if (globalFormKey.currentState!.validate()) {
                                corporateCubit.addCorporateAccount(
                                  corporateNameController,
                                  corporateAccountController,
                                );
                                CustomWidget.gifShowDialog(
                                    Constant.catGif,
                                    context,
                                    'SUCCESS',
                                    'Added New Corporate Account Successfully',
                                    () {
                                  Navigator.popAndPushNamed(
                                      context, RoutesName.dashBoardScreen);
                                  corporateCubit.corporateNameController
                                      .clear();
                                  corporateCubit.corporateAccountController
                                      .clear();
                                });
                              }
                            })
                      ]),
                    ))));
      },
    );
  }
}
