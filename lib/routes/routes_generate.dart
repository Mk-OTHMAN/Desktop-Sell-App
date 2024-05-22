import 'package:flutter/material.dart';
import 'package:home_tools/routes/routes_name.dart';
import 'package:home_tools/views/corporate_account.dart';
import 'package:home_tools/views/customer_account.dart';
import 'package:home_tools/views/dashBoard.dart';
import 'package:home_tools/views/delete_product_screen.dart';
import 'package:home_tools/views/edit_products.dart';
import 'package:home_tools/views/home.dart';
import 'package:home_tools/views/product.dart';
import 'package:home_tools/views/stock_screen.dart';

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
      case RoutesName.stockScreen:
        return MaterialPageRoute(builder: (ctx) => const StockScreen());
      case RoutesName.corporateAccountScreen:
        return MaterialPageRoute(builder: (ctx) => const CorporateAccount());
      case RoutesName.customeAccountScreen:
        return MaterialPageRoute(builder: (ctx) => const CustomerAccount());
      default:
        return MaterialPageRoute(builder: (ctx) => const Home());
    }
  }
}
