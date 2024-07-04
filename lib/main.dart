import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:home_tools/bloc/product/add_product_cubit/add_product_cubit.dart';
import 'package:home_tools/bloc/corporate/corporate_cubit/corporate_cubit.dart';
import 'package:home_tools/bloc/product/search_product_cubit/search_cubit.dart';
import 'package:home_tools/models/corporate/corporate.dart';
import 'package:home_tools/models/product/product.dart';
import 'package:home_tools/views/home.dart';

import 'bloc/corporate/corporate_search/corporate_search_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  ScreenUtil.ensureScreenSize();
  Hive.registerAdapter(ProductAdapter());
  Hive.registerAdapter(CorporateAdapter());
  await Hive.initFlutter();
  await Hive.openBox<Product>('products');
  await Hive.openBox<Corporate>('corporate');
  await Hive.openBox('payHistory');

  runApp(MultiBlocProvider(
    providers: [
      BlocProvider<AddProductCubit>(create: (context) => AddProductCubit()),
      BlocProvider<ProductSearchCubit>(
          create: (context) => ProductSearchCubit()),
      BlocProvider<CorporateCubit>(create: (context) => CorporateCubit()),
      BlocProvider<CorporateSearchCubit>(
          create: (context) => CorporateSearchCubit()),
    ],
    child: const Home(),
  ));
}
