import 'package:flutter/material.dart';
import 'package:flutter_e_commerce_app/commons/widgets/layouts/grid_layout.dart';
import 'package:flutter_e_commerce_app/utils/shimmer/shimmer.dart';

class BrandShimmer extends StatelessWidget {
  const BrandShimmer({super.key, this.itemCount= 4});
  final int itemCount;
  @override
  Widget build(BuildContext context) {
    return GridLayoutImp(itemCount: itemCount,mainAxisExtent: 80, itemBuilder: (_,__)=> const MyShimmerEffect(height: 80, width: 300),);
  }
}