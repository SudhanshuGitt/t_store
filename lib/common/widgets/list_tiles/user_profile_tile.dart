import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:t_store/common/widgets/images/t_circular_image.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/image_strings.dart';

class TUserProfileTile extends StatelessWidget {
  const TUserProfileTile({super.key, required this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const TCircularImage(
        image: TImages.user,
        width: 50,
        height: 50,
        padding: 0,
      ),
      title: Text(
        'Coding with T',
        style: Theme.of(
          context,
        ).textTheme.headlineMedium!.apply(color: TColors.white),
      ),
      subtitle: Text(
        'support@example.com',
        style: Theme.of(
          context,
        ).textTheme.bodyMedium!.apply(color: TColors.white),
      ),

      trailing: IconButton(
        onPressed: () {},
        icon: const Icon(Iconsax.edit_copy, color: TColors.white),
      ),
      onTap: onPressed,
    );
  }
}
