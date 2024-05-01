import 'package:get/get.dart';
import 'package:simon_pkl/material/material.dart';

class SelectLoginController extends GetxController {
  void sebagaiSiswa() {
    // Get.offAllNamed(Routes.LOGIN_SISWA);
    AllMaterial.pilihanLogin = "siswa";
  }
  void sebagaiGuru() {
    // Get.offAllNamed(Routes.LOGIN_SISWA);
     AllMaterial.pilihanLogin = "guru";
  }
  void sebagaiDudi() {
    // Get.offAllNamed(Routes.LOGIN_SISWA);
     AllMaterial.pilihanLogin = "dudi";
  }
}
