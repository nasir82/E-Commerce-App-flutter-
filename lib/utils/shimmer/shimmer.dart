import 'package:flutter/material.dart';
import 'package:flutter_e_commerce_app/utils/constants/color.dart';
import 'package:flutter_e_commerce_app/utils/helpers/helper_funtions.dart';
import 'package:shimmer/shimmer.dart';
class MyShimmerEffect extends StatelessWidget {
  const MyShimmerEffect(
      {super.key,
      required this.height,
      required this.width,
      this.radius = 15,
      this.color});

  final double height, width, radius;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMood(context);
    return Shimmer.fromColors(
      baseColor: dark ? Colors.grey[850]! : Colors.grey[300]!,
      highlightColor: dark ? Colors.grey[700]! : Colors.grey[100]!,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: color ?? (dark ? MyColor.darkerGrey : MyColor.white),
          borderRadius: BorderRadius.circular(radius)
        ),
      )

    );
  }
}
