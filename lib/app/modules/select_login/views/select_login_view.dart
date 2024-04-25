import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:simon_pkl/material/material.dart';

import '../controllers/select_login_controller.dart';

class SelectLoginView extends GetView<SelectLoginController> {
  const SelectLoginView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AllMaterial.colorBlue,
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Sudah siap PKL?",
              style: TextStyle(
                fontSize: 30,
                fontFamily: AllMaterial.fontFamily,
                fontWeight: AllMaterial.fontSemiBold,
                color: AllMaterial.colorWhite,
              ),
            ),
            const SizedBox(height: 5),
            const Text(
              "Pilih mau login sebagai siapa :",
              style: TextStyle(
                fontSize: 16,
                fontFamily: AllMaterial.fontFamily,
                fontWeight: AllMaterial.fontRegular,
                color: AllMaterial.colorWhite,
              ),
            ),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Get.offNamed(RoutesName.loginSiswa);
                  },
                  style: const ButtonStyle(
                    fixedSize: MaterialStatePropertyAll(Size.fromWidth(140)),
                    backgroundColor:
                        MaterialStatePropertyAll(AllMaterial.colorWhite),
                  ),
                  child: const Text(
                    "Siswa PKL",
                    style: TextStyle(
                      fontSize: 13,
                      fontFamily: AllMaterial.fontFamily,
                      fontWeight: AllMaterial.fontSemiBold,
                      color: AllMaterial.colorBlue,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: const ButtonStyle(
                    fixedSize: MaterialStatePropertyAll(Size.fromWidth(140)),
                  ),
                  child: const Text(
                    "Dudi Instansi",
                    style: TextStyle(
                      fontSize: 13,
                      fontFamily: AllMaterial.fontFamily,
                      fontWeight: AllMaterial.fontSemiBold,
                      color: AllMaterial.colorBlue,
                    ),
                  ),
                ),
              ],
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text(
                "Guru Pembimbing",
                style: TextStyle(
                  fontSize: 13,
                  fontFamily: AllMaterial.fontFamily,
                  fontWeight: AllMaterial.fontSemiBold,
                  color: AllMaterial.colorBlue,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
