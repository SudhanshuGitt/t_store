import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:t_store/utils/constants/colors.dart';

class TRatingBarIndicator extends StatelessWidget {
  const TRatingBarIndicator({super.key, required this.rating});

  final double rating;

  @override
  Widget build(BuildContext context) {
    return RatingBarIndicator(
      rating: rating,
      itemSize: 20,
      // by default 5
      itemCount: 5,
      unratedColor: TColors.grey,
      // we not need context and index for first argument
      // _ and for second __
      itemBuilder: (_, __) => Icon(Icons.star, color: TColors.primary),
    );
  }
}
