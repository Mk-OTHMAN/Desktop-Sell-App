import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_tools/bloc/corporate/corporate_cubit/corporate_cubit.dart';
import 'package:home_tools/bloc/corporate/corporate_cubit/corporate_state.dart';
import 'package:home_tools/constant/constant.dart';
import 'package:home_tools/copmonent/table_component/cell_component.dart';

class HistoryAlertListView extends StatefulWidget {
  final int mainIndex;
  const HistoryAlertListView({
    super.key,
    required this.mainIndex,
  });

  @override
  State<HistoryAlertListView> createState() => _HistoryAlertListViewState();
}

class _HistoryAlertListViewState extends State<HistoryAlertListView> {
  @override
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
            Row(children: [
              Expanded(
                child: Container(
                  width: 90.w,
                  height: 40.h,
                  decoration: const BoxDecoration(
                      color: Colors.purple,
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
              // **************** customer price Container *******************
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
                      'paid Amount',
                      style: TextStyle(
                          decoration: TextDecoration.none,
                          fontSize: 5.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  ),
                ),
              ),
            ]),
            //*________________________________________________________
            BlocBuilder<CorporateCubit, CorporateState>(
              builder: (context, state) {
                CorporateCubit corporateCubit =
                    BlocProvider.of<CorporateCubit>(context);
                List x = corporateCubit.corporateBox
                    .getAt(widget.mainIndex)
                    .payHistory;
                return ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: x.length,
                    itemBuilder: (context, index) {
                      return Row(children: [
                        Expanded(
                          child: CellComponent(
                              cellWidth: 90,
                              cellName: corporateCubit.corporateBox
                                  .getAt(index)
                                  .payHistory[index]['date']
                                  .toString()),
                        ),
                        Expanded(
                          child: CellComponent(
                              cellWidth: 90,
                              cellName: corporateCubit.corporateBox
                                  .getAt(index)
                                  .payHistory[index]['amount']
                                  .toString()),
                        )
                      ]);
                    });
              },
            )
          ])),
    ));
  }
}
