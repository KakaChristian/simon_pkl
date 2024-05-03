// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simon_pkl/material/material.dart';
import 'package:string_capitalize/string_capitalize.dart';
import '../controllers/lokasi_pkl_controller.dart';

class LokasiPklView extends GetView<LokasiPklController> {
  List<dynamic> dataDudi = AllMaterial.box.read("dataAllDudi");
  LokasiPklView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AllMaterial.colorWhite,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              surfaceTintColor: AllMaterial.colorWhite,
              backgroundColor: AllMaterial.colorWhite,
              snap: true,
              floating: true,
              actions: [
                Container(
                  margin: const EdgeInsets.only(
                    right: 8,
                  ),
                  width: 40,
                  height: 40,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(30),
                    ),
                    color: AllMaterial.colorBlue,
                  ),
                  child: IconButton(
                    style: const ButtonStyle(
                      iconSize: MaterialStatePropertyAll(20),
                    ),
                    color: AllMaterial.colorWhite,
                    onPressed: () {},
                    icon: const Icon(Icons.search),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(
                    right: 8,
                  ),
                  width: 40,
                  height: 40,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(30),
                    ),
                    color: AllMaterial.colorBlue,
                  ),
                  child: IconButton(
                    onPressed: () {},
                    style: const ButtonStyle(
                      iconSize: MaterialStatePropertyAll(20),
                    ),
                    color: AllMaterial.colorWhite,
                    icon: const Icon(Icons.filter_alt),
                  ),
                ),
              ],
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) => ExpansionTile(
                  onExpansionChanged: (value) {
                    controller.setActiveIndex(value ? index : -1);
                  },
                  initiallyExpanded: false,
                  tilePadding: const EdgeInsets.symmetric(horizontal: 5),
                  controlAffinity: ListTileControlAffinity.leading,
                  title: Row(
                    children: [
                      SizedBox(
                        width: Get.width * 0.6,
                        child:controller.isExpanded(index)
                              ? FittedBox(
                                  fit: BoxFit.scaleDown,
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    textAlign: TextAlign.start,
                                    "${dataDudi[index]["nama_instansi_perusahaan"]}"
                                        .capitalizeEach(),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                    style: const TextStyle(
                                      fontSize: 15,
                                      fontFamily: AllMaterial.fontFamily,
                                      color: AllMaterial.colorBlack,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                )
                              : Text(
                                  textAlign: TextAlign.start,
                                  "${dataDudi[index]["nama_instansi_perusahaan"]}"
                                      .capitalizeEach(),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                  style: const TextStyle(
                                    fontSize: 15,
                                    fontFamily: AllMaterial.fontFamily,
                                    color: AllMaterial.colorBlack,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                        
                      ),
                      Expanded(
                        child: TextButton(
                          style: const ButtonStyle(
                            padding: MaterialStatePropertyAll(
                              EdgeInsets.zero,
                            ),
                          ),
                          onPressed: () {},
                          child: const Text(
                            "Ajukan",
                            style: TextStyle(
                              fontWeight: AllMaterial.fontRegular,
                              fontFamily: AllMaterial.fontFamily,
                              color: AllMaterial.colorGreen,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  children: [
                    ListTile(
                      leading: Text(
                        "Tahun :",
                        style: TextStyle(
                          color: AllMaterial.colorBlack,
                          fontWeight: AllMaterial.fontMedium,
                          fontFamily: AllMaterial.fontFamily,
                        ),
                      ),
                      title: Text(
                        "2024",
                        style: TextStyle(
                          fontFamily: AllMaterial.fontFamily,
                        ),
                      ),
                    ),
                    ListTile(
                      leading: Text(
                        "No. Telpon :",
                        style: TextStyle(
                          color: AllMaterial.colorBlack,
                          fontWeight: AllMaterial.fontMedium,
                          fontFamily: AllMaterial.fontFamily,
                        ),
                      ),
                      title: Text(
                        "${dataDudi[index]["no_telepon"]}",
                        style: TextStyle(
                          fontFamily: AllMaterial.fontFamily,
                        ),
                      ),
                    ),
                    ListTile(
                      leading: Text(
                        "Bidang :",
                        style: TextStyle(
                          color: AllMaterial.colorBlack,
                          fontWeight: AllMaterial.fontMedium,
                          fontFamily: AllMaterial.fontFamily,
                        ),
                      ),
                      title: Text(
                        "${dataDudi[index]["bidang"]}".capitalizeEach(),
                        style: TextStyle(
                          fontFamily: AllMaterial.fontFamily,
                        ),
                      ),
                    ),
                    ListTile(
                      leading: Text(
                        "Alamat :",
                        style: TextStyle(
                          color: AllMaterial.colorBlack,
                          fontWeight: AllMaterial.fontMedium,
                          fontFamily: AllMaterial.fontFamily,
                        ),
                      ),
                      title: Text(
                        "${dataDudi[index]["alamat"]["detail_tempat"]}, ${dataDudi[index]["alamat"]["desa"]}, ${dataDudi[index]["alamat"]["kecamatan"]}, ${dataDudi[index]["alamat"]["kabupaten"]}, ${dataDudi[index]["alamat"]["provinsi"]}"
                            .capitalizeEach(),
                        style: TextStyle(
                          fontFamily: AllMaterial.fontFamily,
                        ),
                      ),
                    ),
                    ListTile(
                      leading: Text(
                        "Kuota :",
                        style: TextStyle(
                          color: AllMaterial.colorBlack,
                          fontWeight: AllMaterial.fontMedium,
                          fontFamily: AllMaterial.fontFamily,
                        ),
                      ),
                      title: Text(
                        "1/4",
                        style: TextStyle(
                          fontFamily: AllMaterial.fontFamily,
                        ),
                      ),
                    ),
                  ],
                ),
                childCount: dataDudi.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
