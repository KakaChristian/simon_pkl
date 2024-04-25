import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:simon_pkl/material/material.dart';

import '../controllers/login_siswa_controller.dart';

class LoginSiswaView extends GetView<LoginSiswaController> {
  const LoginSiswaView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Selamat Datang!",
              style: TextStyle(
                fontSize: 26,
                fontFamily: AllMaterial.fontFamily,
                fontWeight: AllMaterial.fontSemiBold,
                color: AllMaterial.colorBlack,
              ),
            ),
            const SizedBox(height: 15),
            const Text(
              "Silahkan masukkan data Anda",
              style: TextStyle(
                fontSize: 16,
                fontFamily: AllMaterial.fontFamily,
                fontWeight: AllMaterial.fontSemiBold,
                color: AllMaterial.colorBlack,
              ),
            ),
            const SizedBox(height: 15),
            const TextField(
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(
                focusColor: AllMaterial.colorBlue,
                hoverColor: AllMaterial.colorBlue,
                fillColor: AllMaterial.colorBlue,
                contentPadding: EdgeInsets.all(10),
                labelText: 'NISN',
                labelStyle: TextStyle(
                  fontFamily: AllMaterial.fontFamily,
                  fontSize: 14,
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: AllMaterial.colorBlue,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: AllMaterial.colorBlue,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              autocorrect: false,
              cursorColor: AllMaterial.colorBlue,
              obscureText: true,
              decoration: InputDecoration(
                suffixIcon: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.remove_red_eye_rounded,
                    color: AllMaterial.colorGrey,
                  ),
                ),
                focusColor: AllMaterial.colorBlue,
                hoverColor: AllMaterial.colorBlue,
                fillColor: AllMaterial.colorBlue,
                contentPadding: const EdgeInsets.all(10),
                labelText: 'Password',
                labelStyle: const TextStyle(
                  fontFamily: AllMaterial.fontFamily,
                  fontSize: 14,
                ),
                border: const OutlineInputBorder(
                  borderSide: BorderSide(
                    color: AllMaterial.colorBlue,
                  ),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                    color: AllMaterial.colorBlue,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            ElevatedButton(
      style: const ButtonStyle(
        backgroundColor: MaterialStatePropertyAll(
          AllMaterial.colorBlue,
        ),
      ),
      onPressed: (){
        // Get.offNamed(RoutesName.homePageNull);
      },
      child: const Text(
        "Login",
        style: TextStyle(
          fontSize: 13,
          fontFamily: AllMaterial.fontFamily,
          fontWeight: AllMaterial.fontSemiBold,
          color: AllMaterial.colorWhite,
        ),
      ),
    ),
          ],
        ),
      ),
    );
  }
}
