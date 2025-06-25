import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:t_store/common/widgets/layout/grid_layout.dart';
import 'package:t_store/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:t_store/utils/constants/sizes.dart';

class TSortableProducts extends StatelessWidget {
  const TSortableProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ///  Dropdown
        DropdownButtonFormField(
          decoration: const InputDecoration(
            prefixIcon: Icon(Iconsax.sort_copy),
          ),
          onChanged: (value) {},
          items:
              [
                    'Name',
                    'Higher Price',
                    'Lower Price',
                    'Sale',
                    'Newest',
                    'Popularity',
                  ]
                  .map(
                    (option) => DropdownMenuItem(
                      // to select the dropdown
                      value: option,
                      child: Text(option),
                    ),
                  )
                  .toList(),
        ),
        const SizedBox(height: TSizes.spaceBtwSections),

        /// Products
        TGridLayout(
          itemCount: 8,
          itemBuilder: (_, index) => const TProductCardVertical(),
        ),
      ],
    );
  }
}
