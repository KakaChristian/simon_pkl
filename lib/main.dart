import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:simon_pkl/app/modules/dudi/home_dudi/views/home_dudi_view.dart';
import 'package:simon_pkl/app/modules/guru_pembimbing/home_guru/views/home_guru_view.dart';
import 'package:simon_pkl/app/modules/login/controllers/login_controller.dart';
import 'package:simon_pkl/app/modules/login/views/login_view.dart';
import 'package:simon_pkl/app/modules/siswa/home_siswa/views/home_siswa_view.dart';
import 'package:simon_pkl/app/modules/snapshot/views/snapshot_view.dart';

import 'app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  Get.put(LoginController());

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
                  try {
                    print("data auth: ${auth.dataAuth}");
                    print("ini dudi: ${auth.dataLoginDudi}");
                    print("ini guru: ${auth.dataLoginGuru}");
                    print("ini siswa: ${auth.dataLoginSiswa}");

                    if (auth.dataAuth != null && auth.dataLoginDudi != null) {
                      print("route ke home dudi");
                      return HomeDudi();
                    } else if (auth.dataAuth != null &&
                        auth.dataLoginSiswa != null) {
                      print("route ke home siswa");
                      return HomeSiswa();
                    } else if (auth.dataAuth != null &&
                        auth.dataLoginGuru != null) {
                      print("route ke home guru");
                      return HomeGuruView();
                    } else {
                      return LoginView();
                    }
                  } catch (e) {
                    return Scaffold(
                      body: Center(
                        child: Text("Error : $e"),
                      ),
                    );
                  }
                } else if (snapshot.hasError) {
                  return Scaffold(
                    body: Center(
                      child: Text("error di main"),
                    ),
                  );
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
