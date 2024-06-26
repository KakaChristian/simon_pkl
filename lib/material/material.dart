import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

abstract class AllMaterial {
  // SelectLogin
  static String pilihanLogin = "";
  
  // Get Storage
  static final box = GetStorage();

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

  // Dialog
  static dialogSimon({
    required String msg,
    required String msgC,
    void Function()? onCancel,
    void Function()? onConfirm,
  }) {
    return Get.defaultDialog(
      backgroundColor: AllMaterial.colorWhite,
      buttonColor: AllMaterial.colorBlue,
      contentPadding: const EdgeInsets.all(5),
      title: msg,
      titleStyle: const TextStyle(
        fontSize: 15,
        fontWeight: AllMaterial.fontMedium,
        fontFamily: AllMaterial.fontFamily,
      ),
      content: Text(
        msgC,
        style: const TextStyle(
          fontSize: 15,
          fontWeight: AllMaterial.fontMedium,
          fontFamily: AllMaterial.fontFamily,
        ),
      ),
      textConfirm: "Konfirmasi",
      textCancel: "Batalkan",
      onCancel: onCancel,
      onConfirm: onConfirm,
    );
  }

  static alertSimon({
    required String msg,
    required String msgC,
  }) {
    return Get.snackbar(
      msg,
      msgC,
      snackPosition: SnackPosition.BOTTOM,
      duration: Duration(
        milliseconds: 1200,
      ),
    );
  }
}
