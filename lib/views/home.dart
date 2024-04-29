import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_tools/routes/routes_generate.dart';
import 'package:home_tools/routes/routes_name.dart';
import 'package:home_tools/views/dashBoard.dart';

class Home extends StatelessWidget {
  const Home({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (_, child) {
          return const MaterialApp(
            debugShowCheckedModeBanner: false,
            initialRoute: RoutesName.dashBoardScreen,
            onGenerateRoute: GenerateRoute.generateRoute,
            home: Scaffold(
              body: DashBoard(),
            ),
          );
        });
  }
}
