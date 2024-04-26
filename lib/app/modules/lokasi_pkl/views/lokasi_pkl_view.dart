import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:simon_pkl/material/material.dart';

import '../controllers/lokasi_pkl_controller.dart';

class LokasiPklView extends GetView<LokasiPklController> {
  const LokasiPklView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
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
                  style: const ButtonStyle(
                    iconSize: MaterialStatePropertyAll(20),
                  ),
                  color: AllMaterial.colorWhite,
                  onPressed: () {},
                  icon: const Icon(Icons.filter_alt),
                ),
              ),
            ],
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                const Divider(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(
                          right: 8,
                        ),
                        width: 30,
                        height: 30,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(60),
                          ),
                          color: AllMaterial.colorBlue,
                        ),
                        child: IconButton(
                          style: const ButtonStyle(
                            iconSize: MaterialStatePropertyAll(15),
                          ),
                          color: AllMaterial.colorWhite,
                          onPressed: () {},
                          icon: const Icon(Icons.keyboard_arrow_down_sharp),
                        ),
                      ),
                      const Text("Nama"),
                      const Text("PT. Telkomsel IND"),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          "Ajukan",
                          style: TextStyle(
                            color: Colors.green[800],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const Divider(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
