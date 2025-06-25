import 'package:flutter/material.dart';
import 'package:t_store/common/widgets/appbar/appbar.dart';
import 'package:t_store/common/widgets/products/ratings.dart/rating_indicator.dart';
import 'package:t_store/features/shop/screens/product_reviews/widgets/rating_progress_indicator.dart';
import 'package:t_store/features/shop/screens/product_reviews/widgets/user_review_card.dart';
import 'package:t_store/utils/constants/sizes.dart';

class ProductReviewsScreen extends StatelessWidget {
  const ProductReviewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /// AppBar
      appBar: TAppBar(title: Text('Review and Ratings'), showBackArrow: true),

      /// Body
      body: SingleChildScrollView(
        padding: EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Rating and reviews are verified and from people who use the same type of device that you use.',
            ),
            const SizedBox(height: TSizes.spaceBtwItems),

            // Overall product rating
            const TOverallProductRating(),
            const TRatingBarIndicator(rating: 3.5),
            Text('12,611', style: Theme.of(context).textTheme.bodySmall),
            const SizedBox(height: TSizes.spaceBtwSections),

            /// User Reviews List
            const TUserReviewCard(),
            const TUserReviewCard(),
            const TUserReviewCard(),
            const TUserReviewCard(),
          ],
        ),
      ),
    );
  }
}
