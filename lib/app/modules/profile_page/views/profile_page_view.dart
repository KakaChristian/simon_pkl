import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:simon_pkl/app/modules/login_siswa/controllers/login_siswa_controller.dart';
import 'package:simon_pkl/app/modules/profile_page/profile_item.dart';
import 'package:simon_pkl/app/modules/profile_page/profile_item_widget.dart';
import 'package:simon_pkl/app/routes/app_pages.dart';
import 'package:simon_pkl/material/material.dart';

import '../controllers/profile_page_controller.dart';

// ignore: must_be_immutable
class ProfilePageView extends GetView<ProfilePageController> {
  LoginSiswaController dataUser = LoginSiswaController();
  

  ProfilePageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AllMaterial.colorWhite,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            surfaceTintColor: AllMaterial.colorWhite,
            snap: true,
            floating: true,
            backgroundColor: AllMaterial.colorWhite,
            leadingWidth: Get.width,
            leading: const Row(
              children: [
                Padding(
                  padding: EdgeInsets.all(5),
                  child: SizedBox(
                    width: 45,
                    height: 45,
                    child: Image(
                      image: AssetImage("assets/logo/logo-simon-var2.png"),
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "Profil Saya",
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: AllMaterial.fontFamily,
                    fontWeight: AllMaterial.fontBold,
                    color: AllMaterial.colorBlue,
                  ),
                ),
              ],
            ),
            actions: [
              PopupMenuButton(
                  color: AllMaterial.colorWhite,
                  surfaceTintColor: AllMaterial.colorWhite,
                  iconColor: AllMaterial.colorBlue,
                  itemBuilder: (context) {
                    return [
                      PopupMenuItem(
                        onTap: () => AllMaterial.dialogSimon(
                          msg: "Apakah Anda ingin Logout?",
                          msgC:
                              "Jika Anda ingin logout, semua progres dan laporan anda saat ini akan terhapus dan tidak dapat diakses kecuali anda login kembali.",
                          onCancel: () => print("Test Batal"),
                          onConfirm: () => Get.offAllNamed(Routes.SELECT_LOGIN),
                        ),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(
                              Icons.logout_rounded,
                              color: Colors.red,
                            ),
                            Text(
                              "Log out",
                              style: TextStyle(
                                fontFamily: AllMaterial.fontFamily,
                                color: Colors.red,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ];
                  })
            ],
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 15),
              child: Column(
                children: [
                  ProfileItem(),
                  const SizedBox(
                    height: 20,
                  ),
                  const Divider(
                    height: 2,
                  ),
                  ProfileItemWidget(
                    title: "Jurusan",
                    subTitle: "Rekayasa Perangkat Lunak",
                  ),
                  const Divider(
                    height: 2,
                  ),
                  ProfileItemWidget(
                    title: "Kelas",
                    subTitle: "XII RPL 2",
                  ),
                  const Divider(
                    height: 2,
                  ),
                  ProfileItemWidget(
                    title: "Alamat",
                    subTitle: "Jl. Karang Bayan, Lingsar No. 22",
                  ),
                  const Divider(
                    height: 2,
                  ),
                  ProfileItemWidget(
                    title: "Jenis Kelamin",
                    subTitle: "Lapu-Lapu",
                  ),
                  const Divider(
                    height: 2,
                  ),
                  ProfileItemWidget(
                    title: "Agama",
                    subTitle: "Islam (Rill)",
                  ),
                  const Divider(
                    height: 2,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
