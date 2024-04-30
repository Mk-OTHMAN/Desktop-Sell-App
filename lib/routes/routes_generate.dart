import 'package:flutter/material.dart';
import 'package:home_tools/routes/routes_name.dart';
import 'package:home_tools/views/dashBoard.dart';
import 'package:home_tools/views/delete_product_screen.dart';
import 'package:home_tools/views/edit_products.dart';
import 'package:home_tools/views/home.dart';
import 'package:home_tools/views/product.dart';

class GenerateRoute {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.dashBoardScreen:
        return MaterialPageRoute(builder: (ctx) => const DashBoard());
      case RoutesName.productScreen:
        return MaterialPageRoute(builder: (ctx) => const ProductScreen());
      case RoutesName.editProductScreen:
        return MaterialPageRoute(builder: (ctx) => const EditProductScreen());
      case RoutesName.deleteProductScreen:
        return MaterialPageRoute(builder: (ctx) => const DeleteProductScreen());
    }
    return MaterialPageRoute(builder: (ctx) => const Home());
  }
}
