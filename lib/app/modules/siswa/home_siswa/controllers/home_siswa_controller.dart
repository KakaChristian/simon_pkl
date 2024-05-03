import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:simon_pkl/app/modules/login/controllers/login_controller.dart';
import 'package:simon_pkl/app/modules/siswa/beranda_page/views/beranda_page_view.dart';
import 'package:simon_pkl/app/modules/siswa/laporan_page/views/laporan_page_view.dart';

class HomeSiswaController extends GetxController {
  var loginC = LoginController();
  @override
  void onInit() {
    loginC.textBodyC.clear();
    loginC.pwC.clear();
    super.onInit();
  }

  RxInt indexWidget = 0.obs;
  void changeIndexBottomNav(int index) {
    indexWidget.value = index;
  }

  List<Widget> myPage = [
    // BERANDA
     BerandaPageView(),
    // LAPORAN
    const LaporanPageView(),
    // NOTIFIKASI
    
  ];
}
