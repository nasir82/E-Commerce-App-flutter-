import 'package:flutter/material.dart';
import 'package:flutter_e_commerce_app/utils/constants/color.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:iconsax/iconsax.dart';

class MyRatingBarIndicator extends StatelessWidget {
  const MyRatingBarIndicator({
    super.key, required this.rating,
  });

  final double rating;

  @override
  Widget build(BuildContext context) {
    return RatingBarIndicator(
      rating: rating,
      itemSize: 20,
      unratedColor: Colors.grey,
      itemBuilder: (_,index) => const Icon(Iconsax.star1,color: MyColor.primaryColor,)
    );
  }
}
