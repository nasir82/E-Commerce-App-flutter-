import 'package:flutter/material.dart';
import 'package:flutter_e_commerce_app/utils/constants/color.dart';
import 'package:flutter_e_commerce_app/utils/constants/sizes.dart';
import 'package:flutter_e_commerce_app/utils/helpers/helper_funtions.dart';
import 'package:iconsax/iconsax.dart';

class CirculerIcon extends StatelessWidget {
  const  CirculerIcon({
    super.key,
    this.icon = Iconsax.heart5,
    this.onTap,
    this.width,
    this.height,
    this.size = Sizes.lg,
    this.color,
    this.backgroundColor,
  });
  final double? width, height, size;
  final Color? color, backgroundColor;
  final IconData icon;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    // bool dark = HelperFunctions.isDarkMood(context);
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: backgroundColor ?? (HelperFunctions.isDarkMood(context) ? MyColor.black.withOpacity(0.9)
            : MyColor.white.withOpacity(0.9)),
      ),
      child: IconButton(
          onPressed: onTap,
          icon: Icon(
            icon,
            color: color,
            size: size,
          )),
    );
  }
}