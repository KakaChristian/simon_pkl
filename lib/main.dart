import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:simon_pkl/app/modules/dudi/home_dudi/views/home_dudi_view.dart';
import 'package:simon_pkl/app/modules/guru_pembimbing/home_guru/views/home_guru_view.dart';
// import 'package:simon_pkl/app/modules/siswa/home/views/home_view.dart';
import 'package:simon_pkl/app/modules/login/controllers/login_controller.dart';
import 'package:simon_pkl/app/modules/login/views/login_view.dart';
import 'package:simon_pkl/app/modules/siswa/home_siswa/views/home_siswa_view.dart';
import 'package:simon_pkl/app/modules/snapshot/views/snapshot_view.dart';
import 'package:simon_pkl/material/material.dart';

import 'app/routes/app_pages.dart';

void main() async {
  await GetStorage.init();
  Get.put(LoginController());
  // Get.put(ProfilePageController());

  final auth = Get.find<LoginController>();

  runApp(
    GetMaterialApp(
      showSemanticsDebugger: false,
      debugShowCheckedModeBanner: false,
      home: FutureBuilder(
        future: Future.delayed(const Duration(seconds: 3)),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return FutureBuilder(
              future: auth.autoLogin(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  if (auth.isAuth.isTrue == true &&
                      AllMaterial.box.read("token") != null) {
                    if (auth.isDudi == true && auth.dataLoginDudi != null) {
                      return HomeDudi();
                    } else if (auth.isSiswa == true && auth.dataLoginSiswa != null) {
                      return HomeSiswa();
                    } else if (auth.isGuru == true && auth.dataLoginGuru != null) {
                      return HomeGuruView();
                      // return HomeSiswa();
                    } else {
                      return Scaffold();
                    }
                  } else {
                    // return SelectLoginView();
                    return LoginView();
                  }
                } else {
                  return SnapshotView();
                }
              },
            );
          } else {
            return SnapshotView();
          }
        },
      ),
      getPages: AppPages.routes,
    ),
  );
}
