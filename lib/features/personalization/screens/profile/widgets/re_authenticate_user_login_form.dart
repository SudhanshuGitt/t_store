import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:t_store/common/widgets/appbar/appbar.dart';
import 'package:t_store/features/personalization/controllers/user_controller.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/constants/text_strings.dart';
import 'package:t_store/utils/validators/validation.dart';

class ReAuthenticateUserLoginForm extends StatelessWidget {
  const ReAuthenticateUserLoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return Scaffold(
      appBar: TAppBar(
        showBackArrow: true,
        title: Text(
          'Re-Authenticate User',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Text field and Button
            Form(
              key: controller.reAuthFormKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: controller.verifyEmail,
                    validator: (value) => TValidator.validateEmail(value),
                    expands: false,
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Iconsax.direct_copy),
                      labelText: TTexts.email,
                    ),
                  ),
                  const SizedBox(height: TSizes.spaceBtwInputFields),
                  Obx(
                    () => TextFormField(
                      controller: controller.verifyPassword,
                      validator: (value) => TValidator.validatePassword(value),
                      obscureText: controller.hidePassword.value,
                      expands: false,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Iconsax.password_check_copy),
                        suffixIcon: IconButton(
                          onPressed: () => controller.hidePassword.value =
                              !controller.hidePassword.value,
                          icon: Icon(
                            controller.hidePassword.value
                                ? Iconsax.eye_slash_copy
                                : Iconsax.eye_copy,
                          ),
                        ),
                        labelText: TTexts.password,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: TSizes.spaceBtwSections),

            // Login button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () =>
                    controller.reAuthenticateEmailAndPasswordUser(),
                child: const Text('Verify'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
