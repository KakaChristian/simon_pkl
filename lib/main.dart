import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:simon_pkl/app/modules/select_login/views/select_login_view.dart';
import 'package:simon_pkl/app/modules/snapshot/views/snapshot_view.dart';

import 'app/routes/app_pages.dart';

void main() {
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      // home: const LoginSelect(),
      home: FutureBuilder(
        future: Future.delayed(const Duration(seconds: 3)),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const SnapshotView();
          } else {
            return const SelectLoginView();
          }
        },
      ),
      getPages: AppPages.routes,
    ),
  );
}
