import 'package:get/get.dart';

import '../controllers/login_siswa_controller.dart';

class LoginSiswaBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginSiswaController>(
      () => LoginSiswaController(),
    );
  }
}
