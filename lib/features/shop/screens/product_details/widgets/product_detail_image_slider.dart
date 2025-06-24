import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:t_store/common/widgets/appbar/appbar.dart';
import 'package:t_store/common/widgets/custom_shapes/curverd_edges/curved_edges_widget.dart';
import 'package:t_store/common/widgets/icons/t_circular_icon.dart';
import 'package:t_store/common/widgets/images/t_rounded_images.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

class TProductImageSlider extends StatelessWidget {
  const TProductImageSlider({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = THelperFunctions.isDarkMode(context);

    return TCurvedEdgeWidget(
      child: Container(
        color: isDarkMode ? TColors.darkerGrey : TColors.light,
        child: Stack(
          children: [
            /// Main large image
            const SizedBox(
              height: 400,
              child: Padding(
                padding: EdgeInsets.all(TSizes.productImageRadius * 2),
                child: Center(
                  child: Image(image: AssetImage(TImages.productImage5)),
                ),
              ),
            ),

            /// Product Details
            Positioned(
              bottom: 30,
              right: 0,
              left: TSizes.defaultSpace,
              child: SizedBox(
                height: 80,
                child: ListView.separated(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  // we want to make images scrollable
                  physics: const AlwaysScrollableScrollPhysics(),
                  separatorBuilder: (BuildContext context, int index) =>
                      SizedBox(width: TSizes.spaceBtwItems),
                  itemCount: 6,
                  itemBuilder: (context, index) => TRoundedImage(
                    width: 80,
                    backgroundColor: isDarkMode ? TColors.dark : TColors.white,
                    border: Border.all(color: TColors.primary),
                    padding: EdgeInsets.all(TSizes.sm),
                    imageUrl: TImages.productImage3,
                  ),
                ),
              ),
            ),

            /// AppBar Icon
            TAppBar(
              showBackArrow: true,
              actions: [
                TCircularIcon(
                  icon: Iconsax.heart,
                  color: Colors.red,
                  backgroundColor: isDarkMode
                      ? TColors.darkerGrey
                      : TColors.light,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
