import 'package:get/get.dart';

import '../controllers/select_login_controller.dart';

class SelectLoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SelectLoginController>(
      () => SelectLoginController(),
    );
  }
}
