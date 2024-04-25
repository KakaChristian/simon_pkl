import 'package:get/get.dart';

import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/login_siswa/bindings/login_siswa_binding.dart';
import '../modules/login_siswa/views/login_siswa_view.dart';
import '../modules/select_login/bindings/select_login_binding.dart';
import '../modules/select_login/views/select_login_view.dart';
import '../modules/snapshot/bindings/snapshot_binding.dart';
import '../modules/snapshot/views/snapshot_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.SNAPSHOT,
      page: () => const SnapshotView(),
      binding: SnapshotBinding(),
    ),
    GetPage(
      name: _Paths.SELECT_LOGIN,
      page: () => const SelectLoginView(),
      binding: SelectLoginBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN_SISWA,
      page: () => const LoginSiswaView(),
      binding: LoginSiswaBinding(),
    ),
  ];
}
