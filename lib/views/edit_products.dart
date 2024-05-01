import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_tools/bloc/add_product_cubit/add_product_cubit.dart';
import 'package:home_tools/bloc/add_product_cubit/add_product_state.dart';
import 'package:home_tools/constant/constant.dart';
import 'package:home_tools/copmonent/alert_show_dialog/edit_alert_show/edit_alert_recive_number_only.dart';
import 'package:home_tools/copmonent/alert_show_dialog/edit_alert_show/edit_alert_show.dart';
import 'package:home_tools/copmonent/table_component/editProductTable/editCell_component.dart';
import 'package:home_tools/copmonent/table_component/editProductTable/header.dart';
import 'package:home_tools/routes/routes_name.dart';

class EditProductScreen extends StatelessWidget {
  const EditProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Transform.scale(
        scale: .8,
        child: FloatingActionButton(
          onPressed: () =>
              Navigator.popAndPushNamed(context, RoutesName.dashBoardScreen),
          child: const Icon(
            Icons.home,
            size: 40,
          ),
        ),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(color: Constant.greenColor),
        child: BlocProvider(
          create: (context) => AddProductCubit(),
          child: BlocBuilder<AddProductCubit, AddProductState>(
              builder: (context, state) {
            AddProductCubit productCubit =
                BlocProvider.of<AddProductCubit>(context);
            List productsList = productCubit.productBox.values.toList();

            return Column(
              children: [
                const EditProductTableHeader(),
                ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemCount: productsList.length,
                    itemBuilder: (context, index) {
                      return Table(
                        defaultVerticalAlignment:
                            TableCellVerticalAlignment.middle,
                        children: [
                          TableRow(children: [
                            //! _______ main price Cell ______
                            EditCellComponent(
                              cellName: productsList[index].mainPrice,
                              onPressed: () {
                                showDialog(
                                    context: context,
                                    builder: (context) =>
                                        EditAlertShowDialogReciveNumbersOnly(
                                          editFieldController:
                                              productCubit.mainPriceController,
                                          hintText: ' New Price',
                                          labelText: 'New Price',
                                          textUpTextField: 'Edit Main Price',
                                          height: 60,
                                          width: 15,
                                          onPressed: () {
                                            productCubit
                                                .editProductMainPrice(index);
                                            productCubit.gifAlertDialog(
                                              Constant.jobDoneGif,
                                              context,
                                              'SUCCESS',
                                              'Main Price has been Modified successfully',
                                              () => Navigator.popAndPushNamed(
                                                  context,
                                                  RoutesName.editProductScreen),
                                            );
                                          },
                                        ));
                              },
                            ),
                            //! _______ customer price Cell ______
                            EditCellComponent(
                              cellName: productsList[index].customerPrice,
                              onPressed: () {
                                showDialog(
                                    context: context,
                                    builder: (context) =>
                                        EditAlertShowDialogReciveNumbersOnly(
                                          editFieldController: productCubit
                                              .customerPriceController,
                                          hintText: ' New Price',
                                          labelText: 'New Price',
                                          textUpTextField: 'Edit Old Price',
                                          height: 60,
                                          width: 15,
                                          onPressed: () {
                                            productCubit
                                                .editProductCustomerPrice(
                                                    index);
                                            productCubit.gifAlertDialog(
                                              Constant.jobDoneGif,
                                              context,
                                              'SUCCESS',
                                              'Customr Price has been Modified successfully',
                                              () => Navigator.popAndPushNamed(
                                                  context,
                                                  RoutesName.editProductScreen),
                                            );
                                          },
                                        ));
                              },
                            ),
                            //! _____ product Stock Cell ______
                            EditCellComponent(
                              cellName: productsList[index].quantity,
                              onPressed: () {
                                showDialog(
                                    context: context,
                                    builder: (context) =>
                                        EditAlertShowDialogReciveNumbersOnly(
                                          editFieldController: productCubit
                                              .productStockController,
                                          hintText: ' New stock',
                                          labelText: 'Stock Quantity',
                                          textUpTextField: 'New Quantity',
                                          height: 60,
                                          width: 15,
                                          onPressed: () {
                                            productCubit
                                                .editProductStock(index);
                                            productCubit.gifAlertDialog(
                                              Constant.jobDoneGif,
                                              context,
                                              'SUCCESS',
                                              'Your product Stock has been Modified successfully',
                                              () => Navigator.popAndPushNamed(
                                                  context,
                                                  RoutesName.editProductScreen),
                                            );
                                          },
                                        ));
                              },
                            ),
                            //! ______ product Name Cell _________
                            EditCellComponent(
                              cellName: productsList[index].name,
                              fontSize: 4,
                              fontWeight: FontWeight.w800,
                              onPressed: () {
                                showDialog(
                                    context: context,
                                    builder: (context) => EditAlertShowDialog(
                                          editFieldController: productCubit
                                              .productNamecontroller,
                                          hintText: ' New Name',
                                          labelText: 'Product Name',
                                          textUpTextField: 'Edit Product Name',
                                          height: 60,
                                          width: 15,
                                          onPressed: () {
                                            productCubit.editProductName(index);
                                            productCubit.gifAlertDialog(
                                              Constant.jobDoneGif,
                                              context,
                                              'SUCCESS',
                                              'Your product Name has been Modified successfully',
                                              () => Navigator.popAndPushNamed(
                                                  context,
                                                  RoutesName.editProductScreen),
                                            );
                                          },
                                        ));
                              },
                            )
                          ])
                        ],
                      );
                    })
              ],
            );
          }),
        ),
      ),
    );
  }
}
