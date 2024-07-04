import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_tools/bloc/product/add_product_cubit/add_product_cubit.dart';
import 'package:home_tools/bloc/product/add_product_cubit/add_product_state.dart';
import 'package:home_tools/bloc/product/search_product_cubit/search_cubit.dart';
import 'package:home_tools/bloc/product/search_product_cubit/search_state.dart';
import 'package:home_tools/constant/constant.dart';
import 'package:home_tools/copmonent/table_component/table_header.dart';
import 'package:home_tools/copmonent/table_component/table_row.dart';
import 'package:home_tools/routes/routes_name.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ProductSearchCubit searchCubit =
        BlocProvider.of<ProductSearchCubit>(context);
    AddProductCubit productCubit = BlocProvider.of<AddProductCubit>(context);

    return BlocBuilder<ProductSearchCubit, ProductSearchState>(
      builder: (context, state) {
        return Scaffold(
            floatingActionButton: Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.w),
              child: Builder(builder: (context) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    //* search icon + textField
                    searchCubit.isSearch
                        ? searchCubit.searchTextField()
                        : searchCubit.iconSearch(),
                    //* home icon
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
              }),
            ),
            body: Container(
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(color: Constant.mainColor),
                child: BlocBuilder<AddProductCubit, AddProductState>(
                  builder: (context, state) {
                    return Column(
                      children: [
                        const TableHeader(),
                        Expanded(
                          child: ListView.builder(
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              itemCount:
                                  searchCubit.searchController.text.isEmpty
                                      ? productCubit.productBox.values.length
                                      : searchCubit.searchList.length,
                              itemBuilder: (context, index) {
                                return TableCellRow(
                                  productName:
                                      searchCubit.searchController.text.isEmpty
                                          ? productCubit.productBox
                                              .getAt(index)
                                              .name
                                              .toString()
                                          : searchCubit.searchList[index].name,
                                  customerPrice:
                                      searchCubit.searchController.text.isEmpty
                                          ? productCubit.productBox
                                              .getAt(index)
                                              .customerPrice
                                              .toString()
                                          : searchCubit
                                              .searchList[index].customerPrice,
                                  mainPrice: searchCubit
                                          .searchController.text.isEmpty
                                      ? productCubit.productBox
                                          .getAt(index)
                                          .mainPrice
                                          .toString()
                                      : searchCubit.searchList[index].mainPrice,
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
