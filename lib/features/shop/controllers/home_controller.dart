import 'package:get/get.dart';

class HomeController extends GetxController {
  static HomeController get instance => Get.find();

  // this  observer variable will be observed by the getx observer
  final carousalCurrentIndex = 0.obs;

  void updatePageIndicator(index) {
    carousalCurrentIndex.value = index;
  }
}
