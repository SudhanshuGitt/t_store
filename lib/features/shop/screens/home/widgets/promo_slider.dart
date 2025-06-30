import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:t_store/common/widgets/images/t_rounded_images.dart';
import 'package:t_store/common/widgets/shimmer/shimmer_effect.dart';
import 'package:t_store/features/shop/controllers/banner_controller.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/sizes.dart';

class TPromoSlider extends StatelessWidget {
  const TPromoSlider({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(BannerController());

    return Obx(() {
      if (controller.isLoading.value) {
        return const TShimmerEffect(width: double.infinity, height: 190);
      }

      // No Data Found
      if (controller.banners.isEmpty) {
        return Center(child: Text('No Data Found'));
      } else {
        return Column(
          children: [
            CarouselSlider(
              items: controller.banners
                  .map(
                    (banner) => TRoundedImage(
                      imageUrl: banner.imageUrl,
                      isNetworkImage: true,
                      onPressed: () => Get.toNamed(banner.targetScreen),
                    ),
                  )
                  .toList(),
              options: CarouselOptions(
                viewportFraction: 1,
                // we dont need 2nd param pageChangedReason so use '_'
                onPageChanged: (index, _) =>
                    controller.updatePageIndicator(index),
              ),
            ),
            SizedBox(height: TSizes.spaceBtwItems),
            Center(
              child: Obx(
                () => Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    for (int i = 0; i < controller.banners.length; i++)
                      TRoundedContainer(
                        width: 20,
                        height: 4,
                        backgroundColor:
                            controller.carousalCurrentIndex.value == i
                            ? TColors.primary
                            : TColors.grey,
                        margin: EdgeInsets.only(right: 10),
                      ),
                  ],
                ),
              ),
            ),
          ],
        );
      }
    });
  }
}
