import 'package:flutter/material.dart';
import 'package:t_store/common/widgets/appbar/appbar.dart';
import 'package:t_store/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:t_store/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:t_store/common/widgets/images/t_circular_image.dart';
import 'package:t_store/common/widgets/layout/grid_layout.dart';
import 'package:t_store/common/widgets/products/cart/cart_menu_icon.dart';
import 'package:t_store/common/widgets/texts/section_heading.dart';
import 'package:t_store/common/widgets/texts/t_brand_title_text_vertical_icon.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/enums.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = THelperFunctions.isDarkMode(context);

    return Scaffold(
      appBar: TAppBar(
        title: Text('Store', style: Theme.of(context).textTheme.headlineMedium),
        actions: [TCartCounterIcon(onPressed: () {})],
      ),
      // as we need multiple scroll vertical and horizontal we can use NestedScroolView
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              // to hide the back arrow
              automaticallyImplyLeading: false,
              // SilverAppBar will not move when design will be moving
              pinned: true,
              // app bar should become visible as soon as the user scrolls towards the app bar
              floating: true,
              backgroundColor: isDarkMode ? TColors.black : TColors.white,
              // size of appbar size of design we want to put in SliverAppBar
              expandedHeight: 440,

              flexibleSpace: Padding(
                padding: EdgeInsets.all(TSizes.defaultSpace),
                child: ListView(
                  // it will occupy only the space which currently is space of children of
                  // list view
                  shrinkWrap: true,
                  // to avoid scroll
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    /// Search Bar
                    const SizedBox(height: TSizes.spaceBtwItems),
                    const TSearchContainer(
                      text: 'Search in store',
                      showBorder: true,
                      showBackground: false,
                      padding: EdgeInsets.all(0),
                    ),
                    const SizedBox(height: TSizes.spaceBtwSections),

                    /// Featured Brands
                    TSectionHeading(
                      title: 'Featured Brands',
                      showActionButton: true,
                      onPressed: () {},
                    ),
                    const SizedBox(height: TSizes.spaceBtwItems / 1.5),

                    TGridLayout(
                      itemCount: 4,
                      mainAxisExtent: 80,
                      itemBuilder: (_, index) {
                        return GestureDetector(
                          onTap: () {},
                          child: TRoundedContainer(
                            padding: const EdgeInsets.all(TSizes.sm),
                            showBorder: true,
                            backgroundColor: Colors.transparent,
                            child: Row(
                              children: [
                                /// ICons
                                // it will only take space required image to appear
                                Flexible(
                                  child: TCircularImage(
                                    image: TImages.clothIcon,
                                    isNetworkImage: false,
                                    backgroundColor: Colors.transparent,
                                    overlayColor: isDarkMode
                                        ? TColors.white
                                        : TColors.black,
                                  ),
                                ),
                                const SizedBox(width: TSizes.spaceBtwItems / 2),

                                /// Text
                                // it will take the maximum space
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const TBrandTitleWithVerifiedIcon(
                                        title: 'Nike',
                                        brandTextSizes: TextSizes.large,
                                      ),
                                      Text(
                                        '256 products amkamkakaa',
                                        overflow: TextOverflow.ellipsis,
                                        style: Theme.of(
                                          context,
                                        ).textTheme.labelMedium,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ];
        },
        body: Container(),
      ),
    );
  }
}
