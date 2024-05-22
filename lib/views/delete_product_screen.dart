import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_tools/bloc/add_product_cubit/add_product_cubit.dart';
import 'package:home_tools/bloc/add_product_cubit/add_product_state.dart';
import 'package:home_tools/constant/constant.dart';
import 'package:home_tools/copmonent/functions_wiget.dart';
import 'package:home_tools/copmonent/table_component/cell_component.dart';
import 'package:home_tools/copmonent/table_component/delete_cell_component.dart';
import 'package:home_tools/routes/routes_name.dart';

class DeleteProductScreen extends StatelessWidget {
  const DeleteProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    AddProductCubit productCubit = BlocProvider.of<AddProductCubit>(context);

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
                image: DecorationImage(image: AssetImage(Constant.trashMan))),
            child: BlocBuilder<AddProductCubit, AddProductState>(
              builder: (context, state) {
                return Column(children: [
                  const CellComponent(
                    cellName: 'Product Name',
                    fontSize: 4,
                    fontWeight: FontWeight.w600,
                    color: Colors.red,
                    cellWidth: double.infinity,
                  ),
                  ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: productCubit.productBox.values.length,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            Table(
                              defaultVerticalAlignment:
                                  TableCellVerticalAlignment.middle,
                              children: [
                                TableRow(children: [
                                  DeleteCellComponent(
                                      cellName: productCubit.productBox
                                          .getAt(index)
                                          .name
                                          .toString(),
                                      cellWidth: double.infinity,
                                      onPressed: () => Functions.gifShowDialog(
                                              Constant.fireHandGif,
                                              context,
                                              'Warning',
                                              'are you sure you want to delete this product',
                                              () {
                                            productCubit.dleteProduct(index);
                                            Navigator.pop(context);
                                            Functions.gifShowDialog(
                                                Constant.rabitDone,
                                                context,
                                                'Success',
                                                'removed successfully', () {
                                              Navigator.popAndPushNamed(
                                                  context,
                                                  RoutesName
                                                      .deleteProductScreen);
                                            });
                                          }))
                                ]),
                              ],
                            ),
                            const Divider(
                              color: Colors.black,
                              thickness: 1.5,
                              endIndent: 180,
                              indent: 180,
                            )
                          ],
                        );
                      })
                ]);
              },
            )));
  }
}
