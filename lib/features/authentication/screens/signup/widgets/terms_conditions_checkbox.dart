import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/features/authentication/controllers/signup/signup_controller.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/constants/text_strings.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

class TTermsAndConditionsCheckbox extends StatelessWidget {
  const TTermsAndConditionsCheckbox({super.key});

  @override
  Widget build(BuildContext context) {
    // now we dont need to use the get method we only need to create the instance once
    final controller = SignUpController.instance;
    final isDarkMode = THelperFunctions.isDarkMode(context);

    return Row(
      children: [
        // some space was there on left of checkbox
        // to remove we can wrap it with Sizedbox and give width and height
        SizedBox(
          width: 24,
          height: 24,
          child: Obx(
            () => Checkbox(
              value: controller.privacyPolicy.value,
              onChanged: (value) {
                if (value != null) controller.privacyPolicy.value = value;
              },
            ),
          ),
        ),
        const SizedBox(width: TSizes.spaceBtwItems),
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: '${TTexts.iAgreeTo} ',
                style: Theme.of(context).textTheme.bodySmall,
              ),
              TextSpan(
                text: TTexts.privacyPolicy,
                style: Theme.of(context).textTheme.bodyMedium!.apply(
                  color: isDarkMode ? TColors.white : TColors.primary,
                  decoration: TextDecoration.underline,
                  decorationColor: isDarkMode ? TColors.white : TColors.primary,
                ),
              ),
              TextSpan(
                text: ' ${TTexts.and} ',
                style: Theme.of(context).textTheme.bodySmall,
              ),
              TextSpan(
                text: TTexts.termsOfUse,
                style: Theme.of(context).textTheme.bodyMedium!.apply(
                  color: isDarkMode ? TColors.white : TColors.primary,
                  decoration: TextDecoration.underline,
                  decorationColor: isDarkMode ? TColors.white : TColors.primary,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
