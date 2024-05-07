// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simon_pkl/app/routes/app_pages.dart';
import 'package:simon_pkl/material/material.dart';
import 'package:string_capitalize/string_capitalize.dart';
import '../controllers/lokasi_pkl_controller.dart';

class LokasiPklView extends GetView<LokasiPklController> {
  List<dynamic> dataPrevDudi = AllMaterial.box.read("dataPrevDudi");
  var dataAllDudi = AllMaterial.box.read("dataAllDudi");

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
              pinned: true,
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
                (context, index) => FutureBuilder(
                  future: controller.fetchDataById(),
                  builder: (context, snapshot) {
                    var dataAllDudi = AllMaterial.box.read("dataAllDudi");
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return CircularProgressIndicator();
                    } else {
                      return ExpansionTile(
                        onExpansionChanged: (value) {
                          // controller.setActiveIndex(value ? index : -1);
                          controller.fetchDataById();
                          AllMaterial.box.write(
                            "idPrevDudi",
                            dataPrevDudi[index]["id"],
                          );
                        },
                        initiallyExpanded: false,
                        tilePadding: const EdgeInsets.symmetric(horizontal: 5),
                        controlAffinity: ListTileControlAffinity.leading,
                        title: Row(
                          children: [
                            SizedBox(
                              width: Get.width * 0.6,
                              child: FittedBox(
                                fit: BoxFit.scaleDown,
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  textAlign: TextAlign.start,
                                  (dataPrevDudi.isNotEmpty)
                                      ? "${dataPrevDudi[index]["nama_instansi_perusahaan"]}"
                                          .capitalizeEach()
                                      : CircularProgressIndicator().toString(),
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
                            ),
                            Text("$index"),
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
                              (dataAllDudi != null)
                                  ? "${dataAllDudi["no_telepon"]}"
                                  : CircularProgressIndicator().toString(),
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
                              (dataAllDudi != null)
                                  ? "${dataAllDudi["bidang"]}".capitalizeEach()
                                  : CircularProgressIndicator().toString(),
                              // "safawfw",
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
                              "afwaf".capitalizeEach(),
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
                          TextButton(
                            onPressed: () {
                              Get.defaultDialog(
                                middleTextStyle: TextStyle(
                                  fontFamily: AllMaterial.fontFamily,
                                ),
                                backgroundColor: AllMaterial.colorWhite,
                                radius: 10,
                                buttonColor: AllMaterial.colorBlue,
                                titleStyle: TextStyle(
                                    fontWeight: AllMaterial.fontMedium),
                                title: "Konfirmasi",
                                middleText:
                                    "Apakah Anda yakin ingin mengajukan PKL di ${dataPrevDudi[index]["nama_instansi_perusahaan"].toString().capitalizeEach()}?",
                                onConfirm: () {
                                  print("Konfirmasi page");
                                  Get.back();
                                  // Pass selected dataAllDudi to the next page
                                  Get.toNamed(
                                    Routes.AJUAN_PKL,
                                    arguments: {
                                      'selectedData':
                                          dataAllDudi, // Pass dataAllDudi
                                    },
                                  );
                                },
                                barrierDismissible: false,
                                textCancel: "Batalkan",
                                textConfirm: "Konfirmasi",
                              );
                            },
                            child: const Text(
                              "Ajukan",
                              style: TextStyle(
                                fontWeight: AllMaterial.fontRegular,
                                fontFamily: AllMaterial.fontFamily,
                                color: AllMaterial.colorGreen,
                              ),
                            ),
                          ),
                        ],
                      );
                    }
                  },
                ),
                childCount: dataPrevDudi.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
