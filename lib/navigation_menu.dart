import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:t_store/features/shop/screens/home/home.dart';
import 'package:t_store/features/shop/screens/store/store.dart';
import 'package:t_store/features/shop/screens/wishlist/wishlist.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());
    final isDarkMode = THelperFunctions.isDarkMode(context);

    return Scaffold(
      // there must ne obs inside of obx and whenever that obs changes
      // Obx is observer and obs is observer variable
      // whenever the obs change it will redraw the state for us
      bottomNavigationBar: Obx(
        () => NavigationBar(
          height: 80,
          elevation: 0,
          selectedIndex: controller.selectedIndex.value,
          onDestinationSelected: (index) =>
              controller.selectedIndex.value = index,

          backgroundColor: isDarkMode ? TColors.black : TColors.white,
          indicatorColor: isDarkMode
              ? TColors.white.withValues(alpha: 0.1)
              : TColors.black.withValues(alpha: 0.1),
          destinations: [
            NavigationDestination(
              icon: Icon(Iconsax.home_1_copy),
              label: 'Home',
            ),
            NavigationDestination(icon: Icon(Iconsax.shop_copy), label: 'Shop'),
            NavigationDestination(
              icon: Icon(Iconsax.heart_copy),
              label: 'Wishlist',
            ),
            NavigationDestination(
              icon: Icon(Iconsax.user_copy),
              label: 'Profile',
            ),
          ],
        ),
      ),
      body: Obx(() => controller.screens[controller.selectedIndex.value]),
    );
  }
}

// use this to avoid stateful widget
class NavigationController extends GetxController {
  // observer variable which will be observed by the widget
  // setstate will re draw everything on the screen
  // getx will improve the speed of our application
  // it will only redraw what is inside obs
  final Rx<int> selectedIndex = 0.obs;

  final screens = [
    const HomeScreen(),
    const StoreScreen(),
    const WishlistScreen(),
    Container(color: Colors.blue),
  ];
}
