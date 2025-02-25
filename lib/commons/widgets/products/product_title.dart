
import 'package:flutter/material.dart';

class ProductTitle extends StatelessWidget {
  const ProductTitle({
    super.key,
    required this.title,
    this.isSmall = false,
    this.maxLines = 2,
    this.textALign = TextAlign.left,
  });

  final String title;
  final bool isSmall;
  final int maxLines;
  final TextAlign textALign;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: isSmall
          ? Theme.of(context).textTheme.titleSmall
          : Theme.of(context).textTheme.labelLarge,
      overflow: TextOverflow.ellipsis,
      maxLines: maxLines,
      textAlign: textALign,
    );
  }
}
