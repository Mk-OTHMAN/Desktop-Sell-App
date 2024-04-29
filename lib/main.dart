import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:home_tools/models/product.dart';
import 'package:home_tools/views/home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  ScreenUtil.ensureScreenSize();
  Hive.registerAdapter(ProductAdapter());
  await Hive.initFlutter();
  await Hive.openBox<Product>('products');
  runApp(const Home());
}
