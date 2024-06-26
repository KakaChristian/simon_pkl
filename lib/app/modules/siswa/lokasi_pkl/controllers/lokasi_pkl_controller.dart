import 'dart:convert';

import 'package:get/get.dart';
import "package:http/http.dart" as http;
import 'package:simon_pkl/app/routes/app_pages.dart';
import 'package:simon_pkl/material/material.dart';

class LokasiPklController extends GetxController {
  String tampungToken = AllMaterial.box.read("token");
  // static const getDudiUrl = "http://10.0.2.2:2008/siswa/getDudi";
  static const getDudiUrl = "http://10.0.2.2:2008/siswa/getDudiFilter?page=1";
  var expandedIndices = List<bool?>.filled(19, false).obs;

  void setExpansion(int index, bool value) {
    expandedIndices[index] = value;
  }

  // var activeIndex = RxInt(-1);

  @override
  void onClose() {
    AllMaterial.box.remove("dataAllDudi");
    super.onClose();
  }

  // void setActiveIndex() {
  //   fetchDataById();
  // }

  // bool isExpanded(int index) => activeIndex.value == index;

  RxBool isObsecure = true.obs;

  Future<dynamic> fetchData() async {
    final response = await http.get(
      Uri.parse(getDudiUrl),
      headers: {
        "Authorization": "Bearer $tampungToken",
      },
    );
    var data = jsonDecode(response.body);
    if (response.statusCode == 200) {
      Get.toNamed(Routes.LOKASI_PKL);
      AllMaterial.box.write("dataPrevDudi", data["data"]["dudi"]);
      print(data["data"]);
    } else {
      print(data);
      print(tampungToken);
      print(response.statusCode);
      throw Exception('Error min');
    }
  }

  Future<dynamic> fetchDataById() async {
    var dataIdDudi = await AllMaterial.box.read("idPrevDudi");
    final responseId = await http.get(
      Uri.parse("http://10.0.2.2:2008/siswa/getDudi/$dataIdDudi"),
      headers: {
        "Authorization": "Bearer $tampungToken",
      },
    );
    var dataId = jsonDecode(responseId.body);
    print(dataId);
    if (responseId.statusCode == 200) {
      print(dataId["data"]);
      AllMaterial.box.write("dataAllDudi", dataId["data"]);
    } else {
      print("kesalahan di fetch by id");
    }
  }
}
