import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:home_tools/bloc/add_product_cubit/add_product_cubit.dart';
import 'package:home_tools/bloc/search_product_cubit/search_cubit.dart';
import 'package:home_tools/models/product.dart';
import 'package:home_tools/views/home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  ScreenUtil.ensureScreenSize();
  Hive.registerAdapter(ProductAdapter());
  await Hive.initFlutter();
  await Hive.openBox<Product>('products');
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider<AddProductCubit>(create: (context) => AddProductCubit()),
      BlocProvider<ProductSearchCubit>(
          create: (context) => ProductSearchCubit()),
    ],
    child: const Home(),
  ));
}
