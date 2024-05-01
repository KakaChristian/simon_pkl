import 'package:get/get.dart';
import 'package:simon_pkl/app/modules/lokasi_pkl/controllers/lokasi_pkl_controller.dart';
import 'package:simon_pkl/app/routes/app_pages.dart';

class BerandaPageController extends GetxController {
  LokasiPklController dataPKL = LokasiPklController();
  Future<dynamic> ambilDataDudi() async {
    () => Get.toNamed(Routes.LOKASI_PKL);
    await dataPKL.fetchData();
  }
}
