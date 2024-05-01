import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import "package:http/http.dart" as http;
import 'package:simon_pkl/material/material.dart';

class LoginSiswaController extends GetxController {
  static const loginUrl = "http://10.0.2.2:2008/siswa/Login";
  static const getSiswaUrl = "http://10.0.2.2:2008/siswa/getSiswa";
  TextEditingController nisnC = TextEditingController();
  TextEditingController pwC = TextEditingController();

  RxBool isAuth = false.obs;
  RxBool isObsecure = true.obs;
  static String tokenLogin = "";

  final box = GetStorage();

  Future<void> autoLogin() async {
    if (box.read("token") != null) {
      nisnC.dispose();
      pwC.dispose();
      isAuth.value = true;
    }
  }

  Future<void> login() async {
    try {
      final response = await http.post(
        Uri.parse(loginUrl),
        body: {
          "nis": nisnC.text,
          "password": pwC.text,
        },
      );
      var data = jsonDecode(response.body);
      if (nisnC.text.isNotEmpty && pwC.text.isNotEmpty) {
        if (response.statusCode == 200 || response.statusCode == 201) {
          tokenLogin = data["data"]["acces_token_siswa"];
          box.write("token", tokenLogin);
          await fetchData();
          isAuth.value = true;
          nisnC.clear();
          pwC.clear();
          return data;
        } else {
          print("error di response");
          print(response.statusCode);
          await AllMaterial.alertSimon(
            msg: "Kesalahan",
            msgC: "NISN/Password tidak terdaftar",
          );
        }
      } else {
        print("error di empty");
        await AllMaterial.alertSimon(
          msg: "Kesalahan",
          msgC: "NISN/Password harus diisi",
        );
        print(response.body);
      }
    } catch (e) {
      // AllMaterial.alertSimon(
      //   msg: "Error",
      //   msgC: "Terjadi kesalahan saat login",
      print("error : $e");
    }
  }

  Future<dynamic> fetchData() async {
    final response = await http.get(
      Uri.parse(getSiswaUrl),
      headers: {
        "Authorization": "Bearer $tokenLogin",
      },
    );
    var data = jsonDecode(response.body) as Map<String, dynamic>;
    if (response.statusCode == 200) {
      print(data["data"]);
      box.write("siswaData", data["data"]);
      box.write("token", tokenLogin);
      isAuth.value = true;
      nisnC.dispose();
      pwC.dispose();
    } else {
      throw Exception('Error min');
    }
  }
}
