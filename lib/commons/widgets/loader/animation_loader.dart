import 'package:flutter/material.dart';
import 'package:flutter_e_commerce_app/utils/constants/color.dart';
import 'package:flutter_e_commerce_app/utils/constants/sizes.dart';
import 'package:flutter_e_commerce_app/utils/helpers/helper_funtions.dart';

class AnimationLoaderWidget extends StatelessWidget{

  const AnimationLoaderWidget({
    super.key, 
    required this.text,
    required this.animation,
    this.showAction = false,
    this.actionText,
    this.onActionClick,
    
  });

  final String text;
  final String animation;
  final String? actionText;
  final bool showAction;
  final VoidCallback? onActionClick;
  @override
  Widget build(BuildContext context) {
   final isDark = HelperFunctions.isDarkMood(context);
   return  Center(
    child: Column(
      children: [
          //  Lottie.asset(animation,width: MediaQuery.of(context).size.width* .8,height: MediaQuery.of(context).size.width* .4),
            const SizedBox(height: Sizes.defaultSpace,),
            Text(text,style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.center,),
            
           const SizedBox(height: Sizes.defaultSpace,),
           showAction ? SizedBox(
            width: 250,
            child: OutlinedButton(onPressed:onActionClick, child: Text(actionText!,style: Theme.of(context).textTheme.bodyMedium!.apply(
              color: isDark ? MyColor.light : MyColor.dark
            )))
           )  :
           const SizedBox()
      ],
    ),
   );
  }


}