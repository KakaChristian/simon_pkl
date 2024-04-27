import 'package:get/get.dart';

class LokasiPklController extends GetxController {

  var expandedIndices = List<bool?>.filled(19, false).obs;

  void setExpansion(int index, bool value) {
    expandedIndices[index] = value;
  }

  var activeIndex = RxInt(-1);

  void setActiveIndex(int index) {
    if (activeIndex.value != index) {
      activeIndex.value = index;
    } else {
      activeIndex.value = -1;
    }
  }

  bool isExpanded(int index) => activeIndex.value == index;
}

