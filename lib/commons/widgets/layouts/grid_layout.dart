import 'package:flutter/material.dart';
import 'package:flutter_e_commerce_app/utils/constants/sizes.dart';

class GridLayoutImp extends StatelessWidget {
  const GridLayoutImp(
      {super.key,
      required this.itemCount,
      this.mainAxisExtent = 250,
      required this.itemBuilder,
      this.crossAxisCount = 2,
      this.mainAxisSpacing = Sizes.gridViewSpacing,
      this.crossAxisSpacing = Sizes.gridViewSpacing});

  final int itemCount;
  final double mainAxisExtent;
  final double mainAxisSpacing;
  final double crossAxisSpacing;
  final int crossAxisCount;
  final Widget? Function(BuildContext, int) itemBuilder;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: itemCount,
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            mainAxisSpacing: 24,
            crossAxisSpacing: 16,
            mainAxisExtent: mainAxisExtent),
        itemBuilder: itemBuilder);
  }
}