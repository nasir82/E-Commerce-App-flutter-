import 'package:flutter/material.dart';
import 'package:flutter_e_commerce_app/utils/constants/color.dart';
import 'package:flutter_e_commerce_app/utils/device/device_utils.dart';
import 'package:flutter_e_commerce_app/utils/helpers/helper_funtions.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar(
      {super.key,
      this.title,
      this.showBackArrow=false,
      this.leadingIcon,
      this.actions,
      this.leadingOnPressed});

  final Widget? title;
  final bool showBackArrow;
  final IconData? leadingIcon;
  final List<Widget>? actions;
  final VoidCallback? leadingOnPressed;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      leading: showBackArrow ? IconButton(onPressed: ()=> Get.back(), icon:  Icon(Iconsax.arrow_left,color: HelperFunctions.isDarkMood(context) ? MyColor.white : MyColor.dark,)):
      leadingIcon !=null ? IconButton(onPressed: leadingOnPressed, icon: Icon(leadingIcon)):null,
      title: title,
      actions: actions,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(DeviceUtils.getStatusBarHeight());
}
