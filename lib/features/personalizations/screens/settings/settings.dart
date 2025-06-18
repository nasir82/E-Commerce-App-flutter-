import 'package:flutter/material.dart';
import 'package:flutter_e_commerce_app/commons/widgets/appbar/appbar.dart';
import 'package:flutter_e_commerce_app/features/shop/controllers/cart_controller.dart';
import 'package:flutter_e_commerce_app/features/shop/screens/cart/cart.dart';
import 'package:flutter_e_commerce_app/features/home/widgets/circuler_image.dart';
import 'package:flutter_e_commerce_app/features/home/widgets/header_container.dart';
import 'package:flutter_e_commerce_app/features/home/widgets/section_heading.dart';
import 'package:flutter_e_commerce_app/features/shop/screens/order/order_screen.dart';
import 'package:flutter_e_commerce_app/features/personalizations/addresses/address_screen.dart';
import 'package:flutter_e_commerce_app/features/personalizations/controllers/user_controller.dart';
import 'package:flutter_e_commerce_app/features/personalizations/screens/profile/profile.dart';
import 'package:flutter_e_commerce_app/utils/constants/color.dart';
import 'package:flutter_e_commerce_app/utils/constants/image_strings.dart';
import 'package:flutter_e_commerce_app/utils/constants/sizes.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {

    final controller  = CartController.instance;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            HeaderContainer(
                child: Column(
              children: [
                MyAppBar(
                  title: Text(
                    "Account",
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                ),
                const SizedBox(
                  height: Sizes.spaceBtwItems,
                ),

                //user profile card

                const UserProfileTile(),
                const SizedBox(
                  height: Sizes.spaceBtwSections,
                ),
              ],
            )),
             Padding(
              padding: const EdgeInsets.all(Sizes.defaultSpace),
              child: Column(
                children: [
                  //
                  const SectionHeading(title: "Account setting"),
                  const SizedBox(
                    height: Sizes.spaceBtwItems,
                  ),
                   SettingMenu(
                      icon: Iconsax.activity,
                      title: "Address",
                      subtitle: "subtitle",
                      onTap: ()=> Get.to(()=> const UserAddressScreen()),),
                   SettingMenu(
                      icon: Iconsax.activity,
                      title: "My Cart",
                      subtitle: "subtitle",
                      onTap: ()=> Get.to(()=> const MyCart()),
                      ),
                   SettingMenu(
                      icon: Iconsax.activity,
                      title: "My Order",
                      subtitle: "subtitle",
                      onTap: ()=> Get.to(()=> const OrderScreen()),),
                  const SettingMenu(
                      icon: Iconsax.activity,
                      title: "Bank Account",
                      subtitle: "subtitle"),
                  const SettingMenu(
                      icon: Iconsax.activity,
                      title: "My Coupons",
                      subtitle: "subtitle"),
                  const SettingMenu(
                      icon: Iconsax.activity,
                      title: "Notifications",
                      subtitle: "subtitle"),
                  const SettingMenu(
                      icon: Iconsax.activity,
                      title: "Acount Privacy",
                      subtitle: "subtitle"),

                 const SectionHeading(title: "App Settings") ,    
                    SettingMenu(
                      icon: Iconsax.activity,
                      title: "Load Data",
                      subtitle: "subtitle",
                      onTap: () => controller.loadDummyData(),
                     ),
                   const SettingMenu(
                      icon: Iconsax.activity,
                      title: "Geolocation",
                      subtitle: "subtitle",
                      trailing: Iconsax.toggle_off,),
                   const SettingMenu(
                      icon: Iconsax.activity,
                      title: "Safe mode",
                      subtitle: "subtitle",
                      trailing: Iconsax.toggle_off,),
                   const SettingMenu(
                      icon: Iconsax.activity,
                      title: "HD Image Quality",
                      subtitle: "subtitle",
                      trailing: Iconsax.toggle_off,),

                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(onPressed: ()=>UserController.instance.deleteAccountWarnigPopup(), child: const Text("Close account")),
                )
                      
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class SettingMenu extends StatelessWidget {
  const SettingMenu(
      {super.key,
      required this.icon,
      required this.title,
      required this.subtitle,
      this.trailing,
      this.onTap});
  final IconData icon;
  final String title;
  final String subtitle;
  final IconData? trailing;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: Icon(
        icon,
        size: 28,
        color: MyColor.primaryColor,
      ),
      title: Text(
        title,
        style: Theme.of(context)
            .textTheme
            .titleMedium!
            .apply(color: MyColor.primaryColor),
      ),
      subtitle: Text(
        subtitle,
        style: Theme.of(context)
            .textTheme
            .labelMedium!
            .apply(color: MyColor.primaryColor),
      ),
      trailing: IconButton(onPressed: () {}, icon:  Icon(trailing)),
    );
  }
}

class UserProfileTile extends StatelessWidget {
  const UserProfileTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return ListTile(
      leading:   CirculerImage(
        image: controller.user.value.profilePicture,
        width: 60,
        height: 60,
        isNetworkImage: true,
        padding: EdgeInsets.zero,
        fit: BoxFit.cover,
      ),
      title: Obx(
        ()=> Text(
          controller.user.value.fullname,
          style: Theme.of(context)
              .textTheme
              .headlineSmall!
              .apply(color: MyColor.white),
        ),
      ),
      subtitle: Obx(
         ()=> Text(
          controller.user.value.email,
          style:
              Theme.of(context).textTheme.bodyMedium!.apply(color: MyColor.white),
        ),
      ),
      trailing: IconButton(onPressed: () {
        Get.to( const ProfileScreen());
      }, icon: const Icon(Iconsax.edit)),
    );
  }
}
