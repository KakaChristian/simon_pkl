import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:simon_pkl/app/modules/login/controllers/login_controller.dart';
import 'package:simon_pkl/app/modules/siswa/profile_page/profile_item.dart';
import 'package:simon_pkl/app/modules/siswa/profile_page/profile_item_widget.dart';
import 'package:simon_pkl/material/material.dart';

import '../controllers/profile_page_controller.dart';

// ignore: must_be_immutable
class ProfilePageView extends GetView<ProfilePageController> {
  var auth = LoginController();
  var dataSiswa = AllMaterial.box.read("dataSiswa");

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
                        onConfirm: () => auth.logout(),
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
                },
              ),
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
                    subTitle: "${dataSiswa["jurusan"]["nama"]}",
                    // subTitle: "{dataSiswa[jurusan][nama]}",
                  ),
                  const Divider(
                    height: 2,
                  ),
                  ProfileItemWidget(
                    title: "Kelas",
                    subTitle: "${dataSiswa["kelas"]["nama"]}",
                    // subTitle: "{dataSiswa[kelas][nama]}",
                  ),
                  const Divider(
                    height: 2,
                  ),
                  ProfileItemWidget(
                    title: "Alamat",
                    subTitle:
                        "${dataSiswa["alamat"]["detail_tempat"]}, ${dataSiswa["alamat"]["desa"]}, ${dataSiswa["alamat"]["kecamatan"]}, ${dataSiswa["alamat"]["kabupaten"]}, ${dataSiswa["alamat"]["provinsi"]}, ${dataSiswa["alamat"]["negara"]}",
                        // "{dataSiswa[alamat][kecamatan]}, {dataSiswa[alamat][negara]}",
                  ),
                  const Divider(
                    height: 2,
                  ),
                  ProfileItemWidget(
                    title: "Jenis Kelamin",
                    subTitle:
                        "${dataSiswa["jenis_kelamin"].toString().contains('laki') ? 'Laki-Laki' : dataSiswa["jenis_kelamin"]}",
                        // "{dataSiswa[jenis_kelamin",
                  ),
                  const Divider(
                    height: 2,
                  ),
                  ProfileItemWidget(
                    title: "Status PKL",
                    subTitle: (dataSiswa["status"] != null
                        ? dataSiswa["status"].toString().replaceAll('_', ' ')
                        : ""),
                    // subTitle: "af",
                  ),
                  const Divider(
                    height: 2,
                  ),
                  ProfileItemWidget(
                    title: "Guru Pembimbing",
                    subTitle: dataSiswa["guru_pembimbing"]["nama"],
                    // subTitle: "af",
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
