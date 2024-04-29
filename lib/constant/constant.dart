import 'package:flutter/material.dart';

class Constant {
  //? _____ colors ____
  static Color mainColor = const Color(0xff63C2BA);
  static Color greenColor = const Color(0xff2d7a60);
  //? _____ images Path ____
  static String homeBackground = 'asset/images/home_background.jpg';
  static String lottieDishes = 'asset/lottie/packaging-for-delivery.json';
  static String editDialogBackground = 'asset/lottie/product-promotion.json';
  static String jobDoneGif = 'asset/gif/jobDone.gif';
  //?______ globla key variable ____
  static GlobalKey dialogNameKey = GlobalKey();
  static GlobalKey dialogMainPriceKey = GlobalKey();
  static GlobalKey dialogCustomerPriceKey = GlobalKey();
  static GlobalKey dialogStockyKey = GlobalKey();
}
