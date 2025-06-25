import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:t_store/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

class TOrderListItems extends StatelessWidget {
  const TOrderListItems({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = THelperFunctions.isDarkMode(context);

    return ListView.separated(
      shrinkWrap: true,
      itemCount: 10,
      separatorBuilder: (_, index) =>
          const SizedBox(height: TSizes.spaceBtwItems),
      itemBuilder: (_, index) => TRoundedContainer(
        showBorder: true,
        backgroundColor: isDarkMode ? TColors.dark : TColors.light,
        padding: EdgeInsets.all(TSizes.md),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                ///1- Icon
                const Icon(Iconsax.ship_copy),
                const SizedBox(width: TSizes.spaceBtwItems / 2),

                /// Status & Date
                // push IconButton to right as expanded will
                // take all the space
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Processing',
                        style: Theme.of(
                          context,
                        ).textTheme.bodyLarge!.apply(color: TColors.primary),
                      ),
                      Text(
                        '07 Nov 2024',
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                    ],
                  ),
                ),

                /// Icon
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Iconsax.arrow_right_3_copy,
                    size: TSizes.iconSm,
                  ),
                ),
              ],
            ),
            const SizedBox(height: TSizes.spaceBtwItems),

            /// Row 2
            Row(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      ///1- Icon
                      const Icon(Iconsax.tag_copy),
                      const SizedBox(width: TSizes.spaceBtwItems / 2),

                      /// Status & Date
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Order',
                              style: Theme.of(context).textTheme.labelMedium,
                            ),
                            Text(
                              '[#256f2]',
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                Expanded(
                  child: Row(
                    children: [
                      ///1- Icon
                      const Icon(Iconsax.calendar_copy),
                      const SizedBox(width: TSizes.spaceBtwItems / 2),

                      /// Status & Date
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Shipping Date',
                              style: Theme.of(context).textTheme.labelMedium,
                            ),
                            Text(
                              '03 Feb 2025',
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
