import 'package:flutter/material.dart';

abstract class AllMaterial {
  // Font Family
  static const textUp = TextStyle(
    fontSize: 25,
    fontWeight: FontWeight.w500,
    fontFamily: "Montserrat",
  );

  // Font Weight
  static const fontFamily = "Montserrat";
  static const fontBold = FontWeight.w700;
  static const fontSemiBold = FontWeight.w600;
  static const fontMedium = FontWeight.w500;
  static const fontRegular = FontWeight.w400;

  // Color
  static const colorBlue = Color(0xff38A3FF);
  static const colorGrey = Color(0xff676D75);
  static const colorWhite = Colors.white;
  static const colorGreySec = Color(0xffF7F7F7);
  static const colorBlack = Color(0xff1B1D2A);
  static const colorGreen = Color(0xff15DF1D);
}
