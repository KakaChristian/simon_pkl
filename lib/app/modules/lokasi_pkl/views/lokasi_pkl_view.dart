import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simon_pkl/material/material.dart';

import '../controllers/lokasi_pkl_controller.dart';

class LokasiPklView extends GetView<LokasiPklController> {
  const LokasiPklView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var texts = "PT TELKOMSEL INDONESIA JAYA GEMING";
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
                        child: Obx(
                          () => controller.isExpanded(index)
                              ? FittedBox(
                                  child: Text(
                                    texts,
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                    style: const TextStyle(
                                      fontSize: 13,
                                      fontFamily: AllMaterial.fontFamily,
                                      color: AllMaterial.colorBlack,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                )
                              : Text(
                                  texts,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                  style: const TextStyle(
                                    fontSize: 13,
                                    fontFamily: AllMaterial.fontFamily,
                                    color: AllMaterial.colorBlack,
                                    fontWeight: FontWeight.bold,
                                  ),
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
                  children: const [
                    ListTile(
                      leading: Text(
                        "Tahun :",
                        style: TextStyle(
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
                          fontFamily: AllMaterial.fontFamily,
                        ),
                      ),
                      title: Text(
                        "081234567891",
                        style: TextStyle(
                          fontFamily: AllMaterial.fontFamily,
                        ),
                      ),
                    ),
                    ListTile(
                      leading: Text(
                        "Kode :",
                        style: TextStyle(
                          fontFamily: AllMaterial.fontFamily,
                        ),
                      ),
                      title: Text(
                        "000021",
                        style: TextStyle(
                          fontFamily: AllMaterial.fontFamily,
                        ),
                      ),
                    ),
                    ListTile(
                      leading: Text(
                        "Kuota :",
                        style: TextStyle(
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
                childCount: 19,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
