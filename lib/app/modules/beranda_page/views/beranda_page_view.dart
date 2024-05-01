// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:simon_pkl/material/material.dart';

import '../controllers/beranda_page_controller.dart';

class BerandaPageView extends GetView<BerandaPageController> {
  var controllerB = Get.put(BerandaPageController());
  BerandaPageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AllMaterial.colorWhite,
      appBar: AppBar(
        surfaceTintColor: AllMaterial.colorWhite,
        backgroundColor: AllMaterial.colorWhite,
        leading: Padding(
          padding: const EdgeInsets.all(5),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            width: 25,
            height: 25,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/logo/logo-simon-var2.png"),
              ),
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(5),
            child: IconButton(
              onPressed: () {
                controllerB.ambilDataDudi();
              },
              icon: const Icon(Icons.add_outlined),
              color: Colors.white,
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                  AllMaterial.colorBlue,
                ),
              ),
            ),
          ),
        ],
      ),
      body: const Center(
        child: Text(
          "Belum ada data nih...\nKlik + untuk memilih instansi",
          textAlign: TextAlign.center,
          style: TextStyle(fontFamily: AllMaterial.fontFamily),
        ),
      ),
    );
  }
}
