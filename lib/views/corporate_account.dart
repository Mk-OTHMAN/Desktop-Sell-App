import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_tools/bloc/corporate/corporate_cubit/corporate_cubit.dart';
import 'package:home_tools/constant/constant.dart';
import 'package:home_tools/copmonent/alert_show_dialog/corporat_alertShow/paid_alertShow.dart';
import 'package:home_tools/copmonent/alert_show_dialog/corporat_alertShow/paid_history_alert_show.dart';
import 'package:home_tools/copmonent/functions_wiget.dart';
import 'package:home_tools/copmonent/table_component/cell_component.dart';
import 'package:home_tools/copmonent/table_component/cell_with_2widget.dart';
import 'package:home_tools/copmonent/table_component/corporate_header.dart';
import 'package:home_tools/copmonent/table_component/editProductTable/editCell_component.dart';
import '../bloc/corporate/corporate_cubit/corporate_state.dart';
import '../bloc/corporate/corporate_search/corporate_search_cubit.dart';
import '../bloc/corporate/corporate_search/corporate_search_state.dart';
import '../routes/routes_name.dart';

class CorporateAccount extends StatelessWidget {
  const CorporateAccount({super.key});

  @override
  Widget build(BuildContext context) {
    CorporateCubit corporateCubit = BlocProvider.of<CorporateCubit>(context);
    GlobalKey<FormState> globalKey = GlobalKey<FormState>();
    return Scaffold(
        floatingActionButton:
            BlocBuilder<CorporateSearchCubit, CorporateSearchState>(
          builder: (context, state) {
            CorporateSearchCubit searchCubit =
                BlocProvider.of<CorporateSearchCubit>(context);
            return Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                searchCubit.isSearch
                    ? searchCubit.searchTextField()
                    : searchCubit.iconSearch(),
                Transform.scale(
                  scale: .7,
                  child: FloatingActionButton(
                    onPressed: () => Navigator.popAndPushNamed(
                        context, RoutesName.dashBoardScreen),
                    child: const Icon(
                      Icons.home,
                      size: 40,
                    ),
                  ),
                ),
              ],
            );
          },
        ),
        body: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(color: Constant.mainColor),
            child: BlocBuilder<CorporateSearchCubit, CorporateSearchState>(
                builder: (context, state) {
              CorporateSearchCubit searchCubit =
                  BlocProvider.of<CorporateSearchCubit>(context);
              List corporateList = corporateCubit.corporateBox.values.toList();
              searchCubit.searchList = corporateList
                  .where((element) => element.name
                      .toLowerCase()
                      .startsWith(searchCubit.searchController.text))
                  .toList();

              return Column(children: [
                const CorporateTableHeader(),
                Expanded(
                    child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: searchCubit.searchController.text.isEmpty
                            ? corporateList.length
                            : searchCubit.searchList.length,
                        itemBuilder: (context, index) {
                          return Table(
                            children: [
                              TableRow(children: [
                                //! _______ remaining Amount Cell ______
                                CellComponent(
                                    cellName: corporateCubit.corporateBox
                                                .getAt(index)
                                                .paidAmount ==
                                            '0'
                                        ? corporateCubit.corporateBox
                                            .getAt(index)
                                            .forwardAmount
                                        : searchCubit
                                                .searchController.text.isEmpty
                                            ? corporateCubit.corporateBox
                                                .getAt(index)
                                                .remainingAmount
                                            : searchCubit.searchList[index]
                                                .remainingAmount),
                                //! _______ paid Amount Cell ______
                                CellComponent(
                                    cellName: searchCubit
                                            .searchController.text.isEmpty
                                        ? corporateCubit.corporateBox
                                            .getAt(index)
                                            .paidAmount
                                        : searchCubit
                                            .searchList[index].paidAmount),
                                //! _______  Amount Cell ______
                                CellComponent(
                                  cellName:
                                      searchCubit.searchController.text.isEmpty
                                          ? corporateCubit.corporateBox
                                              .getAt(index)
                                              .forwardAmount
                                          : searchCubit
                                              .searchList[index].forwardAmount,
                                ),
                                //! _______ date Cell ______
                                CellComponent(
                                  cellName:
                                      searchCubit.searchController.text.isEmpty
                                          ? corporateCubit.corporateBox
                                              .getAt(index)
                                              .date
                                          : searchCubit.searchList[index].date,
                                ),
                                //! _______ Name Cell ______
                                EditCellComponent(
                                    cellName: searchCubit
                                            .searchController.text.isEmpty
                                        ? corporateCubit.corporateBox
                                            .getAt(index)
                                            .name
                                        : searchCubit.searchList[index].name,
                                    onPressed: () {
                                      showDialog(
                                          context: context,
                                          builder: (context) =>
                                              CorporatePayAndHistoryAlertShow(
                                                  corporateName: searchCubit
                                                          .searchController
                                                          .text
                                                          .isEmpty
                                                      ? corporateCubit
                                                          .corporateBox
                                                          .getAt(index)
                                                          .name
                                                      : searchCubit
                                                          .searchList[index]
                                                          .name,
                                                  index: index,
                                                  globalKey: globalKey));
                                    })
                                // CellComponentWith2Widget(
                                //   fontWeight: FontWeight.normal,
                                //   cellName:
                                //       searchCubit.searchController.text.isEmpty
                                //           ? corporateCubit.corporateBox
                                //               .getAt(index)
                                //               .name
                                //           : searchCubit.searchList[index].name,
                                //   widget: BlocBuilder<CorporateCubit,
                                //       CorporateState>(
                                //     builder: (context, state) {
                                //       CorporateCubit corporateCubit =
                                //           BlocProvider.of<CorporateCubit>(
                                //               context);
                                //       return CustomWidget.circleAvatar(
                                //           Constant.walletPaid,
                                //           15,
                                //           () => showDialog(
                                //                 context: context,
                                //                 builder: (context) => Form(
                                //                   key: globalKey,
                                //                   child: PaidAlertShow(
                                //                     editFieldController:
                                //                         corporateCubit
                                //                             .corporatePaidAmountController,
                                //                     textUpTextField:
                                //                         'Paid Amount',
                                //                     labelText: 'Amount',
                                //                     hintText:
                                //                         'Enter Paid Amount',
                                //                     width: 15,
                                //                     height: 38,
                                //                     onPressed: () {
                                //                       if (globalKey
                                //                           .currentState!
                                //                           .validate()) {
                                //                         corporateCubit.paidMethod(
                                //                             index,
                                //                             corporateCubit
                                //                                 .corporatePaidAmountController);
                                //                         AwesomeDialog(
                                //                                 context:
                                //                                     context,
                                //                                 dialogType:
                                //                                     DialogType
                                //                                         .success,
                                //                                 animType: AnimType
                                //                                     .rightSlide,
                                //                                 title:
                                //                                     'Success',
                                //                                 desc:
                                //                                     'Paid Successfully',
                                //                                 btnOkOnPress:
                                //                                     () {
                                //                                   Navigator.of(
                                //                                           context)
                                //                                       .popAndPushNamed(
                                //                                           RoutesName
                                //                                               .corporateAccountScreen);
                                //                                 },
                                //                                 width: 250.w)
                                //                             .show();
                                //                       }
                                //                     },
                                //                   ),
                                //                 ),
                                //               ));
                                //     },
                                //   ),
                                // )
                              ])
                            ],
                          );
                        }))
              ]);
            })));
  }
}
