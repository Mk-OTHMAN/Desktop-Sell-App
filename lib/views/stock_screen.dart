import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_tools/bloc/product/add_product_cubit/add_product_cubit.dart';
import 'package:home_tools/bloc/product/search_product_cubit/search_cubit.dart';
import 'package:home_tools/constant/constant.dart';
import 'package:home_tools/copmonent/table_component/cell_component.dart';
import 'package:home_tools/routes/routes_name.dart';

class StockScreen extends StatelessWidget {
  const StockScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ProductSearchCubit searchCubit =
        BlocProvider.of<ProductSearchCubit>(context);
    AddProductCubit productCubit = BlocProvider.of<AddProductCubit>(context);
    List productsList = productCubit.productBox.values.toList();
    return Scaffold(
        floatingActionButton: Row(
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
        ),
        body: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              color: Constant.mainColor,
            ),
            child: Column(
              children: [
                const Row(
                  children: [
                    CellComponent(
                      cellName: 'Stock',
                      fontSize: 5,
                      fontWeight: FontWeight.bold,
                      color: Colors.orange,
                      cellWidth: 180,
                    ),
                    CellComponent(
                      cellName: 'Product Name',
                      fontSize: 5,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                      cellWidth: 180,
                    ),
                  ],
                ),
                Expanded(
                  child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: productsList.length,
                      itemBuilder: (context, index) {
                        return Table(
                          defaultVerticalAlignment:
                              TableCellVerticalAlignment.middle,
                          children: [
                            TableRow(children: [
                              CellComponent(
                                cellName: searchCubit
                                        .searchController.text.isEmpty
                                    ? productsList[index].quantity.toString()
                                    : searchCubit.searchList[index].quantity
                                        .toString(),
                                cellWidth: 180,
                              ),
                              CellComponent(
                                cellName:
                                    searchCubit.searchController.text.isEmpty
                                        ? productsList[index].name
                                        : searchCubit.searchList[index].name,
                                cellWidth: 180,
                              )
                            ]),
                          ],
                        );
                      }),
                )
              ],
            )));
  }
}
