
import 'package:flutter/material.dart';
import 'package:flutter_e_commerce_app/utils/constants/sizes.dart';
import 'package:iconsax/iconsax.dart';

class RatingAndShare extends StatelessWidget {
  const RatingAndShare({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            const Icon(Iconsax.star5,color: Colors.amber,size: 24,),
            const SizedBox(height: Sizes.spaceBtwItems,),
            Text.rich(
              TextSpan(
                children: [
        
                  TextSpan(
                    text: "5.0",style: Theme.of(context).textTheme.bodyLarge
                  ),
                  const TextSpan(text: "(199)")
                ]
              )
            )
          ],
        ),
         IconButton(onPressed: (){}, icon:const Icon(Icons.share,size: Sizes.iconmd,))
      ],
    );
  }
}

