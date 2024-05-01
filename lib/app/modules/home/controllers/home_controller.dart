import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:simon_pkl/app/modules/beranda_page/views/beranda_page_view.dart';
import 'package:simon_pkl/app/modules/laporan_page/views/laporan_page_view.dart';

class HomeController extends GetxController {
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
