import 'package:flutter/material.dart';
import 'package:flutter_e_commerce_app/utils/constants/sizes.dart';
import 'package:flutter_e_commerce_app/utils/shimmer/shimmer.dart';

class CategoryShimmer extends StatelessWidget {
  const CategoryShimmer({super.key,this.itemCount = 6});
  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      height: 90,
      child: ListView.separated(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: itemCount,
        itemBuilder: (_,__){
          return const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
                MyShimmerEffect(height: 55, width: 55,radius: 55,),
                SizedBox(height: Sizes.spaceBtwItems/2,),
                MyShimmerEffect(height: 8, width: 55)
            ],
          );
        },
         separatorBuilder: (_,__) => const SizedBox(width: Sizes.spaceBtwItems,),
        ),
    );
  }
}