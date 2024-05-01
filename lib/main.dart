import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:simon_pkl/app/modules/home/views/home_view.dart';
import 'package:simon_pkl/app/modules/login_siswa/controllers/login_siswa_controller.dart';
import 'package:simon_pkl/app/modules/login_siswa/views/login_siswa_view.dart';
import 'package:simon_pkl/app/modules/snapshot/views/snapshot_view.dart';

import 'app/routes/app_pages.dart';

void main() async {
  await GetStorage.init();
  Get.put(LoginSiswaController());

  final auth = Get.find<LoginSiswaController>();

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
                  if (auth.isAuth.isTrue) {
                    return HomePageAwal();
                  } else {
                    return LoginSiswaView();
                  }
                } else {
                  return Scaffold();
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
