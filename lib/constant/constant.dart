import 'package:flutter/material.dart';

class Constant {
  //? _____ colors ____
  static Color mainColor = const Color(0xff63C2BA);
  static Color greenColor = const Color(0xff2d7a60);
  static Color redColor1 = const Color(0xffFFF0E3);
  static Color redColor2 = const Color(0xffF7C8A4);

  //? _____ images Path ____
  static String homeBackground = 'asset/images/home_background.jpg';
  static String lottieDishes = 'asset/lottie/packaging-for-delivery.json';
  static String editDialogBackground = 'asset/lottie/product-promotion.json';
  static String jobDoneGif = 'asset/gif/jobDone.gif';
  static String trashMan = 'asset/images/woolly-man.png';
  //?______ globla key variable ____
  static GlobalKey dialogNameKey = GlobalKey();
  static GlobalKey dialogMainPriceKey = GlobalKey();
  static GlobalKey dialogCustomerPriceKey = GlobalKey();
  static GlobalKey dialogStockyKey = GlobalKey();
}
