// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simon_pkl/app/modules/login_siswa/controllers/login_siswa_controller.dart';
// import 'package:simon_pkl/app/models/user_model_data.dart';

// import 'package:simon_pkl/app/models/user_model.dart';
import 'package:simon_pkl/app/modules/profile_page/controllers/profile_page_controller.dart';
import 'package:simon_pkl/material/material.dart';

class ProfileItem extends GetView<ProfilePageController> {

  ProfileItem({
    super.key,
  });

  var dataSiswa = LoginSiswaController.box.read("siswaData");

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 80,
          height: 80,
          decoration: BoxDecoration(
            border: Border.all(width: 4, color: AllMaterial.colorBlue),
            boxShadow: const [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 2,
                offset: Offset(2, 3),
              ),
            ],
            borderRadius: const BorderRadius.all(Radius.circular(50)),
            image: const DecorationImage(
              image: AssetImage("assets/logo/habil.jpg"),
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(width: 20),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
            'Nama : ${dataSiswa["nama"]}',
              style: TextStyle(
                fontSize: 15,
                fontFamily: AllMaterial.fontFamily,
                fontWeight: AllMaterial.fontBold,
              ),
            ),
            Text(
              'NISN : ${dataSiswa["nis"]}',
              style: TextStyle(
                fontSize: 12,
                fontFamily: AllMaterial.fontFamily,
                fontWeight: AllMaterial.fontSemiBold,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
