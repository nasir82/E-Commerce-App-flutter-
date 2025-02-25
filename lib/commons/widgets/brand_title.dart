import 'package:flutter/material.dart';
import 'package:flutter_e_commerce_app/utils/constants/enums.dart';

class BrandTitleText extends StatelessWidget {
  const BrandTitleText({
    super.key,
    required this.title,
    this.textColor,
    this.maxLines = 1,
    this.textAlign = TextAlign.center,
    this.textSize = TextSizes.small,
  });
  final String title;
  final Color? textColor;
  final int maxLines;
  final TextAlign? textAlign;
  final TextSizes textSize;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textAlign: textAlign,
      style: textSize == TextSizes.small
          ? Theme.of(context).textTheme.labelMedium!.apply(color: textColor)
          : textSize == TextSizes.medium
              ? Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .apply(color: textColor)
              : textSize == TextSizes.large
                  ? Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .apply(color: textColor)
                  : Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .apply(color: textColor),
      overflow: TextOverflow.ellipsis,
      maxLines: maxLines,
    );
  }
}