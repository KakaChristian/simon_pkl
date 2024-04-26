import 'package:get/get.dart';

import '../modules/beranda_page/bindings/beranda_page_binding.dart';
import '../modules/beranda_page/views/beranda_page_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/laporan_page/bindings/laporan_page_binding.dart';
import '../modules/laporan_page/views/laporan_page_view.dart';
import '../modules/login_siswa/bindings/login_siswa_binding.dart';
import '../modules/login_siswa/views/login_siswa_view.dart';
import '../modules/lokasi_pkl/bindings/lokasi_pkl_binding.dart';
import '../modules/lokasi_pkl/views/lokasi_pkl_view.dart';
import '../modules/notifikasi_page/bindings/notifikasi_page_binding.dart';
import '../modules/notifikasi_page/views/notifikasi_page_view.dart';
import '../modules/profile_page/bindings/profile_page_binding.dart';
import '../modules/profile_page/views/profile_page_view.dart';
import '../modules/select_login/bindings/select_login_binding.dart';
import '../modules/select_login/views/select_login_view.dart';
import '../modules/snapshot/bindings/snapshot_binding.dart';
import '../modules/snapshot/views/snapshot_view.dart';

// ignore_for_file: constant_identifier_names

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomePageAwal(),
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
    GetPage(
      name: _Paths.LAPORAN_PAGE,
      page: () => const LaporanPageView(),
      binding: LaporanPageBinding(),
    ),
    GetPage(
      name: _Paths.BERANDA_PAGE,
      page: () => const BerandaPageView(),
      binding: BerandaPageBinding(),
    ),
    GetPage(
      name: _Paths.NOTIFIKASI_PAGE,
      page: () => NotifikasiPageView(),
      binding: NotifikasiPageBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE_PAGE,
      page: () => const ProfilePageView(),
      binding: ProfilePageBinding(),
    ),
    GetPage(
      name: _Paths.LOKASI_PKL,
      page: () => const LokasiPklView(),
      binding: LokasiPklBinding(),
    ),
  ];
}
