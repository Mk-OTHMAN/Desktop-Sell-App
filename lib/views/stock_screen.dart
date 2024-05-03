import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_tools/bloc/add_product_cubit/add_product_cubit.dart';
import 'package:home_tools/bloc/add_product_cubit/add_product_state.dart';
import 'package:home_tools/constant/constant.dart';
import 'package:home_tools/copmonent/table_component/cell_component.dart';
import 'package:home_tools/routes/routes_name.dart';

class StockScreen extends StatelessWidget {
  const StockScreen({super.key});

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
        decoration: BoxDecoration(
          color: Constant.mainColor,
        ),
        child: BlocProvider(
          create: (context) => AddProductCubit(),
          child: BlocBuilder<AddProductCubit, AddProductState>(
              builder: (context, state) {
            AddProductCubit productCubit =
                BlocProvider.of<AddProductCubit>(context);
            List productsList = productCubit.productBox.values.toList();

            return Column(
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
                            CellComponent(
                              cellName: productCubit.productBox
                                  .getAt(index)
                                  .quantity
                                  .toString(),
                              fontSize: 4,
                              fontWeight: FontWeight.w600,
                              cellWidth: 180,
                            ),
                            CellComponent(
                              cellName: productCubit.productBox
                                  .getAt(index)
                                  .name
                                  .toString(),
                              fontSize: 4,
                              fontWeight: FontWeight.w600,
                              cellWidth: 180,
                            )
                          ]),
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
