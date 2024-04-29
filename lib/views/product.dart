import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_tools/bloc/add_product_cubit/add_product_cubit.dart';
import 'package:home_tools/bloc/add_product_cubit/add_product_state.dart';
import 'package:home_tools/constant/constant.dart';
import 'package:home_tools/copmonent/table_component/table_header.dart';
import 'package:home_tools/copmonent/table_component/table_row.dart';
import 'package:home_tools/routes/routes_name.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

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
        decoration: BoxDecoration(color: Constant.mainColor),
        child: BlocProvider(
          create: (context) => AddProductCubit(),
          child: BlocBuilder<AddProductCubit, AddProductState>(
              builder: (context, state) {
            AddProductCubit productCubit =
                BlocProvider.of<AddProductCubit>(context);
            List productsList = productCubit.productBox.values.toList();

            return Column(
              children: [
                const TableHeader(),
                ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemCount: productsList.length,
                    itemBuilder: (context, index) {
                      return TableCellRow(
                        productName: productCubit.productBox.getAt(index).name,
                        mainPrice:
                            productCubit.productBox.getAt(index).mainPrice,
                        customerPrice:
                            productCubit.productBox.getAt(index).customerPrice,
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
