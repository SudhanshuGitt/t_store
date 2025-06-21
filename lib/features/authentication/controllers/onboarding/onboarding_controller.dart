import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:t_store/features/authentication/screens/login/login.dart';

// as we are using get state management
class OnboardingController extends GetxController {
  // instance variable is calling Get.find() and return OnboardingController
  static OnboardingController get instance => Get.find();

  // variables
  final pageController = PageController();
  // observer is another widget which is going to change the design without using stateful widget
  // Rx variables can easily be changes and state is going to change on design as well
  Rx<int> currentPageIndex = 0.obs;

  // update current index when Page Scroll
  void updatePageIndicator(index) => currentPageIndex.value = index;

  // jump to specific dot selected page
  void dotNavigationClick(index) {
    // to get value of the integer to update the integer
    currentPageIndex.value = index;
    pageController.jumpToPage(index);
  }

  // Update Current Index & jump to next page
  void nextPage() {
    if (currentPageIndex.value == 2) {
      Get.to(LoginScreen());
    } else {
      int page = currentPageIndex.value + 1;
      pageController.jumpToPage(page);
    }
  }

  // update current index & jump to last page
  void skipPage() {
    Get.to(LoginScreen());
  }
}
