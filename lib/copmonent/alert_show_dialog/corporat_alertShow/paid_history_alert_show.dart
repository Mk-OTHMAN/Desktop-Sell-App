import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_tools/constant/constant.dart';
import 'package:home_tools/copmonent/functions_wiget.dart';
import 'package:home_tools/routes/routes_name.dart';
import 'package:lottie/lottie.dart';
import '../../../bloc/corporate/corporate_cubit/corporate_cubit.dart';
import '../../../bloc/corporate/corporate_cubit/corporate_state.dart';
import 'history_alert_listview.dart';
import 'paid_alertShow.dart';

class CorporatePayAndHistoryAlertShow extends StatelessWidget {
  final String corporateName;
  final GlobalKey<FormState> globalKey;
  final int index;
  const CorporatePayAndHistoryAlertShow(
      {super.key,
      required this.corporateName,
      required this.index,
      required this.globalKey});

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
              Text(
                "NAME",
                style: TextStyle(
                    fontSize: 5.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              //*------ corporate name _______
              Container(
                width: 120.w,
                height: 40.h,
                decoration: const BoxDecoration(
                  color: Colors.transparent,
                  shape: BoxShape.rectangle,
                  border: BorderDirectional(
                      top: BorderSide(
                          width: 1.75,
                          style: BorderStyle.solid,
                          color: Colors.black),
                      bottom: BorderSide(
                          width: 1.75,
                          style: BorderStyle.solid,
                          color: Colors.black),
                      end: BorderSide(
                          width: 1,
                          style: BorderStyle.solid,
                          color: Colors.black),
                      start: BorderSide(
                          width: 1,
                          style: BorderStyle.solid,
                          color: Colors.black)),
                ),
                child: Center(
                  child: Text(
                    corporateName,
                    style: TextStyle(
                        decoration: TextDecoration.none,
                        fontSize: 5.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                ),
              ),
              SizedBox(height: 100.h),
              //* ------ pay & history of paid -----
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  //*------------ history of paid -------
                  Column(
                    children: [
                      Text(
                        "History Pay",
                        style: TextStyle(
                            fontSize: 7.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                      InkWell(
                          overlayColor: const MaterialStatePropertyAll(
                              Colors.transparent),
                          child: CircleAvatar(
                            backgroundColor: Colors.transparent,
                            radius: 50,
                            child: Lottie.asset(
                              Constant.lottiepayHistory,
                            ),
                          ),
                          onTap: () {
                            showDialog(
                                context: context,
                                builder: (context) =>
                                    HistoryAlertListView(mainIndex: index));
                          }),
                    ],
                  ),
                  //*------------ pay -------

                  BlocBuilder<CorporateCubit, CorporateState>(
                      builder: (context, state) {
                    CorporateCubit corporateCubit =
                        BlocProvider.of<CorporateCubit>(context);
                    return Column(
                      children: [
                        Text(
                          "Pay",
                          style: TextStyle(
                              fontSize: 7.sp,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                        CustomWidget.pay(
                            Constant.lottiePay,
                            () => showDialog(
                                  context: context,
                                  builder: (context) => Form(
                                    key: globalKey,
                                    child: PaidAlertShow(
                                      editFieldController: corporateCubit
                                          .corporatePaidAmountController,
                                      textUpTextField: 'Paid Amount',
                                      labelText: 'Amount',
                                      hintText: 'Enter Paid Amount',
                                      width: 15,
                                      height: 38,
                                      onPressed: () {
                                        if (globalKey.currentState!
                                            .validate()) {
                                          corporateCubit.paidMethod(
                                              index,
                                              corporateCubit
                                                  .corporatePaidAmountController);
                                          AwesomeDialog(
                                                  context: context,
                                                  dialogType:
                                                      DialogType.success,
                                                  animType: AnimType.rightSlide,
                                                  title: 'Success',
                                                  desc: 'Paid Successfully',
                                                  btnOkOnPress: () {
                                                    Navigator.of(context)
                                                        .popAndPushNamed(RoutesName
                                                            .corporateAccountScreen);
                                                  },
                                                  width: 250.w)
                                              .show();
                                        }
                                      },
                                    ),
                                  ),
                                )),
                      ],
                    );
                  }),
                ],
              ),
              Lottie.asset(Constant.lottieBysecl,
                  width: 60.w, height: 60.h, fit: BoxFit.cover),
            ]),
          )),
    );
  }
}
