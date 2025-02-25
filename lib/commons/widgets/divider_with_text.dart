import 'package:flutter/material.dart';
import 'package:flutter_e_commerce_app/utils/constants/color.dart';

class DividerWithText extends StatelessWidget {
  const DividerWithText({
    super.key,
    required this.dark,
    required this.text
  });

  final bool dark;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
            child: Divider(
          color: dark ? MyColor.darkGrey : MyColor.grey,
          indent: 60,
          endIndent: 5,
          thickness: 0.5,
        )),
        Text(
          text,
          style: Theme.of(context).textTheme.labelMedium,
        ),
        Flexible(
            child: Divider(
          color: dark ? MyColor.darkGrey : MyColor.grey,
          indent: 5,
          endIndent: 60,
          thickness: 0.5,
        )),
      ],
    );
  }
}