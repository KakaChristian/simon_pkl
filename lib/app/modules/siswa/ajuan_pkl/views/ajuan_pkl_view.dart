// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:simon_pkl/material/material.dart';

import '../controllers/ajuan_pkl_controller.dart';

class AjuanPklView extends GetView<AjuanPklController> {
  // var dataDudiIndex = Get.arguments;
  final dataDudiIndex = Get.arguments['selectedData'];
  AjuanPklView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    print(dataDudiIndex);
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  width: Get.width,
                  height: Get.height * 0.31,
                  decoration: BoxDecoration(
                    color: AllMaterial.colorBlue,
                  ),
                ),
                Column(
                  children: [
                    Icon(
                      MdiIcons.clockCheckOutline,
                      color: AllMaterial.colorWhite,
                      size: 80,
                    ),
                    Text(
                      "Ajuan Diproses",
                      style: TextStyle(
                        color: AllMaterial.colorWhite,
                        fontFamily: AllMaterial.fontFamily,
                        fontSize: 25,
                        fontWeight: AllMaterial.fontSemiBold,
                      ),
                    ),
                    Text(
                      "${dataDudiIndex}",
                      style: TextStyle(
                        color: AllMaterial.colorWhite,
                        fontFamily: AllMaterial.fontFamily,
                        fontSize: 15,
                        fontWeight: AllMaterial.fontRegular,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Container(
                height: Get.height * 0.3,
                width: Get.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: AllMaterial.colorWhite,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
