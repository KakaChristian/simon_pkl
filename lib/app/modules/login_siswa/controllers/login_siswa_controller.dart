import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import "package:http/http.dart" as http;
import 'package:simon_pkl/app/models/user_model.dart';
// import 'package:simon_pkl/app/routes/app_pages.dart';
import 'package:simon_pkl/material/material.dart';

class LoginSiswaController extends GetxController {
  static const loginUrl = "http://10.0.2.2:2008/siswa/Login";
  static const getSiswaUrl = "http://10.0.2.2:2008/siswa/getSiswa";
  TextEditingController nisnC = TextEditingController();
  TextEditingController pwC = TextEditingController();

  // RxList userList = List<UserData>().obs;
  RxList userList = <UserModel>[].obs;

  // var userList = List<UserModel>().obs;
  RxBool isObsecure = true.obs;
  var token = "";

  final box = GetStorage();

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
          token = data["data"]["acces_token_siswa"];
          box.write("token", token);
          await fetchData();
          // Get.offNamed(Routes.HOME);
          return data;
        } else {
          AllMaterial.alertSimon(
            msg: "Kesalahan",
            msgC: "NISN/Password tidak terdaftar",
          );
        }
      } else {
        AllMaterial.alertSimon(
          msg: "Kesalahan",
          msgC: "NISN/Password harus diisi",
        );
      }
    } catch (e) {
      AllMaterial.alertSimon(
        msg: "Error",
        msgC: "Terjadi kesalahan saat login",
      );
      print("error : $e");
    }
  }

  // Future<void> fetchData() async {
  //   final response = await http.get(
  //     Uri.parse(getSiswaUrl),
  //     headers: {
  //       "Authorization": "Bearer $token",
  //     },
  //   );
  //   var data = jsonDecode(response.body);
  //   if (response.statusCode == 200) {
  // box.write("siswaData", data["data"]);
  //     print(data["data"]);
  //   } else {
  //     print("Error saat fetch data");
  //     print(token);
  //     print(response.statusCode);
  //   }
  // }

  Future<dynamic> fetchData() async {
    final response = await http.get(
      Uri.parse(getSiswaUrl),
      headers: {
        "Authorization": "Bearer $token",
      },
    );
    var data = jsonDecode(response.body);
    if (response.statusCode == 200) {
      // userList.assignAll(data);

      print(data["data"]);
      box.write("siswaData", data["data"]);
      // return UserModel.fromJson(data);
    } else {
      throw Exception('Error min');
    }
  }
}

// nisn: 33463143
