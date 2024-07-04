import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_tools/bloc/product/add_product_cubit/add_product_cubit.dart';
import 'package:home_tools/bloc/product/add_product_cubit/add_product_state.dart';
import 'package:home_tools/bloc/product/search_product_cubit/search_cubit.dart';
import 'package:home_tools/bloc/product/search_product_cubit/search_state.dart';
import 'package:home_tools/constant/constant.dart';
import 'package:home_tools/copmonent/alert_show_dialog/alert_show%20_cases/show_dialog_editCaseString.dart';
import 'package:home_tools/copmonent/table_component/editProductTable/editCell_component.dart';
import 'package:home_tools/copmonent/table_component/editProductTable/header.dart';
import 'package:home_tools/routes/routes_name.dart';

import '../copmonent/alert_show_dialog/alert_show _cases/show_dialog_editCaseNumbr.dart';

class EditProductScreen extends StatefulWidget {
  const EditProductScreen({super.key});

  @override
  State<EditProductScreen> createState() => _EditProductScreenState();
}

class _EditProductScreenState extends State<EditProductScreen> {
  @override
  void initState() {
    super.initState();
    AddProductCubit productCubit = BlocProvider.of<AddProductCubit>(context);
    ProductSearchCubit searchCubit =
        BlocProvider.of<ProductSearchCubit>(context);
    List productList = productCubit.productBox.values.toList();
    searchCubit.searchList = productList
        .where((element) => element.name
            .toLowerCase()
            .startsWith(searchCubit.searchController.text))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddProductCubit, AddProductState>(
      builder: (context, state) {
        AddProductCubit productCubit =
            BlocProvider.of<AddProductCubit>(context);
        return Scaffold(
            floatingActionButton:
                BlocBuilder<ProductSearchCubit, ProductSearchState>(
              builder: (context, state) {
                ProductSearchCubit searchCubit =
                    BlocProvider.of<ProductSearchCubit>(context);
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
                decoration: BoxDecoration(color: Constant.greenColor),
                child: BlocBuilder<ProductSearchCubit, ProductSearchState>(
                  builder: (context, state) {
                    ProductSearchCubit searchCubit =
                        BlocProvider.of<ProductSearchCubit>(context);
                    GlobalKey<FormState> editScreenKey = GlobalKey<FormState>();
                    List productList = productCubit.productBox.values.toList();
                    searchCubit.searchList = productList
                        .where((element) => element.name
                            .toLowerCase()
                            .startsWith(searchCubit.searchController.text))
                        .toList();

                    return Column(
                      children: [
                        const EditProductTableHeader(),
                        Expanded(
                          child: ListView.builder(
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              itemCount:
                                  searchCubit.searchController.text.isEmpty
                                      ? productList.length
                                      : searchCubit.searchList.length,
                              itemBuilder: (context, index) {
                                return Table(
                                  children: [
                                    TableRow(children: [
                                      //! _______ main price Cell ______
                                      EditCellComponent(
                                        cellName: searchCubit
                                                .searchController.text.isEmpty
                                            ? productCubit.productBox
                                                .getAt(index)
                                                .mainPrice
                                            : searchCubit
                                                .searchList[index].mainPrice,
                                        onPressed: () {
                                          showDialogForEditCaseTextFieldReciveNumberOnly(
                                            context: context,
                                            globalKeyState: editScreenKey,
                                            editFieldController: productCubit
                                                .productMainPriceController,
                                            hintText: ' New Price',
                                            labelText: 'New Price',
                                            textUpTextField: 'Edit Main Price',
                                            successProcessMessage:
                                                'Main Price has been Modified successfully',
                                            routeNameAfterSuccessProcessDone:
                                                RoutesName.editProductScreen,
                                            functionForMakeProcess: () =>
                                                productCubit
                                                    .editProductMainPriceByIndex(
                                                        index,
                                                        productList,
                                                        searchCubit.searchList),
                                          );
                                        },
                                      ),
                                      //! _______ customer price Cell ______
                                      EditCellComponent(
                                        cellName: searchCubit
                                                .searchController.text.isEmpty
                                            ? productCubit.productBox
                                                .getAt(index)
                                                .customerPrice
                                            : searchCubit.searchList[index]
                                                .customerPrice,
                                        onPressed: () {
                                          showDialogForEditCaseTextFieldReciveNumberOnly(
                                            context: context,
                                            globalKeyState: editScreenKey,
                                            editFieldController: productCubit
                                                .productCustomerPriceController,
                                            hintText: ' New Price',
                                            labelText: 'New Price',
                                            textUpTextField:
                                                'Edit Customer Price',
                                            successProcessMessage:
                                                'Customer Price has been Modified successfully',
                                            routeNameAfterSuccessProcessDone:
                                                RoutesName.editProductScreen,
                                            functionForMakeProcess: () =>
                                                productCubit
                                                    .editProductCustomerPrice(
                                                        index,
                                                        productList,
                                                        searchCubit.searchList),
                                          );
                                        },
                                      ),

                                      // //! _____ product Stock Cell ______
                                      EditCellComponent(
                                        cellName: searchCubit
                                                .searchController.text.isEmpty
                                            ? productCubit.productBox
                                                .getAt(index)
                                                .quantity
                                            : searchCubit
                                                .searchList[index].quantity,
                                        onPressed: () {
                                          showDialogForEditCaseTextFieldReciveNumberOnly(
                                            context: context,
                                            globalKeyState: editScreenKey,
                                            editFieldController: productCubit
                                                .productStockController,
                                            hintText: ' New Quantity',
                                            labelText: 'New Quantity',
                                            textUpTextField:
                                                'Edit Old Quantity',
                                            successProcessMessage:
                                                'New Quantity has been Added successfully',
                                            routeNameAfterSuccessProcessDone:
                                                RoutesName.editProductScreen,
                                            functionForMakeProcess: () =>
                                                productCubit.editProductStock(
                                                    index,
                                                    productList,
                                                    searchCubit.searchList),
                                          );
                                        },
                                      ),

                                      // //! ______ product Name Cell _________
                                      EditCellComponent(
                                        cellName: searchCubit
                                                .searchController.text.isEmpty
                                            ? productCubit.productBox
                                                .getAt(index)
                                                .name
                                            : searchCubit
                                                .searchList[index].name,
                                        onPressed: () {
                                          showDialogForEditCaseTextFieldReciveStringOrNumber(
                                            context: context,
                                            globalKeyState: editScreenKey,
                                            editFieldController: productCubit
                                                .productNamecontroller,
                                            hintText: ' New Name',
                                            labelText: 'New Name',
                                            textUpTextField: 'Edit Old Name',
                                            successProcessMessage:
                                                'Old Name has been Modified successfully',
                                            routeNameAfterSuccessProcessDone:
                                                RoutesName.editProductScreen,
                                            functionForMakeProcess: () =>
                                                productCubit.editProductName(
                                                    index,
                                                    productList,
                                                    searchCubit.searchList),
                                          );
                                        },
                                      ),
                                    ])
                                  ],
                                );
                              }),
                        )
                      ],
                    );
                  },
                )));
      },
    );
  }
}
