import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import "package:http/http.dart" as http;
import 'package:simon_pkl/material/material.dart';

class LoginController extends GetxController {
  static const loginUrl = "http://10.0.2.2:2008/auth/auth";
  static const getSiswaUrl = "http://10.0.2.2:2008/siswa/getSiswa";
  static const getDudiUrl =
      "http://10.0.2.2:2008/pembimbingDudi/getPembimbingDudi";

  bool isDudi = false;
  bool isSiswa = false;
  bool isGuru = false;

  TextEditingController textBodyC = TextEditingController();
  TextEditingController pwC = TextEditingController();

  RxBool isAuth = false.obs;
  RxBool isObsecure = true.obs;
  var getDataUrl = "";
  static String tokenLogin = AllMaterial.box.read("token");
  final dataLoginDudi = AllMaterial.box.read("dataLoginDudi");
  final dataLoginGuru = AllMaterial.box.read("dataLoginGuru");
  final dataLoginSiswa = AllMaterial.box.read("dataLoginSiswa");

  // Future<void> autoLogin() async {
  //   if (tokenLogin != "") {
  //     textBodyC.dispose();
  //     pwC.dispose();
  //     // await login();
  //     isAuth.value = true;
  //   }
  // }

  Future<void> login() async {
    try {
      final response = await http.post(
        Uri.parse(loginUrl),
        body: {
          "textBody": textBodyC.text,
          "password": pwC.text,
        },
      );
      var data = jsonDecode(response.body);
      if (textBodyC.text.isNotEmpty && pwC.text.isNotEmpty) {
        print(response.statusCode);
        if (response.statusCode == 200 || response.statusCode == 201) {
          print(data["auth"]);
          AllMaterial.box.write("token", data["acces_token"]);
          // print(tokenLogin);
          await autoLogin();
          if (data["auth"] == "pembimbing dudi") {
            getDataUrl = getDudiUrl;
            isAuth.value = true;
            isDudi = true;
            return data;
          } else if (data["auth"] == "guru pembimbing") {
            getDataUrl = "";
            isAuth.value = true;
            isGuru = true;
            return data;
          } else if (data["auth"] == "siswa") {
            getDataUrl = getSiswaUrl;
            isAuth.value = true;
            isSiswa = true;
            return data;
          }
        } else {
          print("error di response");
          print(response.statusCode);
          await AllMaterial.alertSimon(
            msg: "Kesalahan",
            msgC: data["msg"],
          );
        }
      } else {
        print("error di empty");
        await AllMaterial.alertSimon(
          msg: "Kesalahan",
          msgC: "NISN/Password harus diisi",
        );
      }
    } catch (e) {
      print("error : $e");
    }
  }

  Future<void> autoLogin() async {
    try {
      final tokenLogin = AllMaterial.box.read("token");
      if (tokenLogin != null) {
        final response = await http.get(
          Uri.parse(getDataUrl),
          headers: {
            "Authorization": "Bearer $tokenLogin",
          },
        );
        print(getDataUrl);
        print(response.body);
        
        if (response.statusCode == 200) {
          isAuth.value = true;
          var data = jsonDecode(response.body);
          if (data["auth"] == "pembimbing dudi") {
            AllMaterial.box.write("dataLoginDudi", data["data"]);
            isDudi = true;
            print(isDudi);
          } else if (data["auth"] == "guru pembimbing") {
            AllMaterial.box.write("dataLoginGuru", data["data"]);
            isGuru = true;
            print(isGuru);
          } else if (data["auth"] == "siswa") {
            AllMaterial.box.write("dataLogin Siswa", data["data"]);
            isSiswa = true;
            print(isSiswa);
          }
        } else {
          AllMaterial.box.erase();
          isAuth.value = false;
        }
      }
    } catch (e) {
      print(dataLoginDudi);
      print("error di autoLogin : $e");
    }
  }

  void logout() {
    AllMaterial.box.erase();
    isAuth.value = false;
    update();
  }

  @override
  void onClose() {
    textBodyC.clear();
    pwC.clear();
    super.onClose();
  }
}

  // Future<dynamic> fetchDataSiswa() async {
  //   final response = await http.get(
  //     Uri.parse(getSiswaUrl),
  //     headers: {
  //       "Authorization": "Bearer $tokenLogin",
  //     },
  //   );
  //   var data = jsonDecode(response.body) as Map<String, dynamic>;
  //   print(response.statusCode);
  //   if (response.statusCode == 200) {
  //     print(data["data"]);
  //     AllMaterial.box.write("siswaData", data["data"]);
  //     isAuth.value = true;
  //   } else {
  //     throw Exception('Error min');
  //   }
  // }