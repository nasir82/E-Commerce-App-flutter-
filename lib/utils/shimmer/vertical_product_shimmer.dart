import 'package:flutter/material.dart';
import 'package:flutter_e_commerce_app/commons/widgets/layouts/grid_layout.dart';
import 'package:flutter_e_commerce_app/utils/constants/sizes.dart';
import 'package:flutter_e_commerce_app/utils/shimmer/shimmer.dart';

class VerticalProductShimmer extends StatelessWidget {
  const VerticalProductShimmer({super.key,this.itmeCount = 6});

  final int itmeCount;

  @override
  Widget build(BuildContext context) {
    return  GridLayoutImp(
        itemBuilder: (_,__)=> const SizedBox(
          width: 180,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
                MyShimmerEffect(height: 180, width: 180),
                SizedBox(height: Sizes.spaceBtwItems,),
                MyShimmerEffect(height: 15, width: 180),
                SizedBox(height: Sizes.spaceBtwItems/2,),
                MyShimmerEffect(height: 15, width: 110)
            ],
          ),
        ),
        itemCount: itmeCount,
    );
  }
}