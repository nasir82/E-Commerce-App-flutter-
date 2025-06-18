import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_e_commerce_app/commons/widgets/appbar/appbar.dart';
import 'package:flutter_e_commerce_app/commons/widgets/layouts/grid_layout.dart';
import 'package:flutter_e_commerce_app/commons/widgets/verified_brand_title_text.dart';
import 'package:flutter_e_commerce_app/data/repositories/product/brand_product.dart';
import 'package:flutter_e_commerce_app/features/home/widgets/cart_counter.dart';
import 'package:flutter_e_commerce_app/features/home/widgets/category_tab.dart';
import 'package:flutter_e_commerce_app/features/home/widgets/circuler_image.dart';
import 'package:flutter_e_commerce_app/features/home/widgets/my_circulercontainer.dart';
import 'package:flutter_e_commerce_app/features/home/widgets/search_container.dart';
import 'package:flutter_e_commerce_app/features/home/widgets/section_heading.dart';
import 'package:flutter_e_commerce_app/features/home/widgets/tab_bar.dart';
import 'package:flutter_e_commerce_app/features/shop/screens/product_details/all_brands.dart';
import 'package:flutter_e_commerce_app/features/shop/controllers/category_controller.dart';
import 'package:flutter_e_commerce_app/features/shop/models/brand_model.dart';
import 'package:flutter_e_commerce_app/features/store/controller/brand_controller.dart';
import 'package:flutter_e_commerce_app/utils/constants/color.dart';
import 'package:flutter_e_commerce_app/utils/constants/enums.dart';
import 'package:flutter_e_commerce_app/utils/constants/sizes.dart';
import 'package:flutter_e_commerce_app/utils/helpers/helper_funtions.dart';
import 'package:flutter_e_commerce_app/utils/shimmer/brand_shimmer.dart';
import 'package:flutter_e_commerce_app/utils/shimmer/shimmer.dart';
import 'package:get/get.dart';

class Store extends StatelessWidget {
  const Store({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(BrandController());
    final categories = CategoryController.instance.allCategories;
    return DefaultTabController(
      length: categories.length, // categories.length,
      child: Scaffold(
          appBar: const MyAppBar(
            title: Text("Store"),
            actions: [
              Padding(
                padding: EdgeInsets.only(right: 10),
                child: CartCounter(
                    iconColor: MyColor.primaryColor),
              )
            ],
          ),
          body: NestedScrollView(
              headerSliverBuilder: (context, innScrol) {
                return [
                  SliverAppBar(
                    automaticallyImplyLeading: false,
                    pinned: true,
                    floating: true,
                    backgroundColor: HelperFunctions.isDarkMood(context)
                        ? MyColor.black
                        : MyColor.white,
                    expandedHeight: 440,
                    flexibleSpace: Padding(
                      padding: const EdgeInsets.all(Sizes.defaultSpace),
                      child: ListView(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        children: [
                          const SizedBox(
                            height: Sizes.spaceBtwItems,
                          ),
                          const SearchContainer(
                            text: "Search product",
                            showBackground: false,
                            showBorder: true,
                            padding: EdgeInsets.zero,
                          ),
                          const SizedBox(
                            height: Sizes.spaceBtwSections,
                          ),
                          SectionHeading(
                            title: "Features Brand",
                            isShowButton: true,
                            onPressed: ()=> Get.to(()=> const AllBrands()),
                          ),
                          const SizedBox(
                            height: Sizes.spaceBtwItems / 1.5,
                          ),
                          Obx(
                            (){
                              if(controller.isLoading.value) return const BrandShimmer();
                              if(controller.allBrands.isEmpty){
                                print("##########\n there is no brand \n ##############");
                                return  Center(
                                  child: Text("No data found",style: Theme.of(context).textTheme.bodyMedium!.apply(
                                    color: Colors.white
                                  ),),
                                  
                                );
                              }
                              return  GridLayoutImp(
                                itemCount: controller.featureBrands.length > 4 ? 4 : controller.featureBrands.length,
                                mainAxisSpacing: 16,
                                mainAxisExtent: 80,
                                itemBuilder: (context, index) {
                                  final brand = controller.allBrands[index];
                                  return  BrandCard(showBorder: true, brand: brand,onTap: ()=> Get.to(()=> BrandProducts(brand: brand)),);
                                });
                            }
                          )
                        ],
                      ),
                    ),
                    bottom: MyTabBar(tabs: 
                    categories.map((category)=>Tab(
                        text: category.name,
                      ), ).toList()
                    ),
                  )
                ];
              },
              body:  TabBarView(children:categories.map((cat)=> CategoryTab(category: cat)).toList()))),
    );
  }
}

class BrandShowCase extends StatelessWidget {
  const BrandShowCase({super.key, required this.images, required this.brand});
  final List<String> images;
  final BrandModel brand;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()=> Get.to(()=> BrandProducts(brand: brand)),
      child: MyCirculerContainer(
        showBorder: true,
        borderColor: MyColor.darkGrey,
        backgroundColor: Colors.transparent,
        padding: const EdgeInsets.all(Sizes.md),
        margin: const EdgeInsets.only(bottom: Sizes.spaceBtwItems),
        child: Column(
          children: [
             BrandCard(
              showBorder: true,
              brand:brand,
            ),
            SizedBox(height: Sizes.spaceBtwItems/2,),
            Row(
                children: images
                    .map((image) => brandToProductImages(image, context))
                    .toList())
          ],
        ),
      ),
    );
  }

  Widget brandToProductImages(String image, context) {
    return Expanded(
      child: MyCirculerContainer(
        height: 100,
        backgroundColor: HelperFunctions.isDarkMood(context)
            ? MyColor.darkerGrey
            : MyColor.light,
        margin: const EdgeInsets.only(right: Sizes.sm),
        padding: const EdgeInsets.all(Sizes.md),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(5),
          child: CachedNetworkImage(
            fit: BoxFit.contain,
            imageUrl: image,
            progressIndicatorBuilder: (context,url, erro)=> const MyShimmerEffect(height: 100, width: 100),
            errorWidget: (context,url,error)=> const Icon(Icons.error),
          ),
        ),
      ),
    );
  }
}

class BrandCard extends StatelessWidget {
  const BrandCard({
    super.key,
    required this.brand,
    this.showBorder = true,
    this.onTap,
  });
  final BrandModel brand;
  final bool showBorder;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: MyCirculerContainer(
        padding: const EdgeInsets.all(Sizes.sm),
        showBorder: showBorder,
        backgroundColor: Colors.transparent,
        child: Row(
          children: [
            Flexible(
              child: CirculerImage(
                isNetworkImage: true,
                image: brand.image,
                backgroundColor: Colors.transparent,
                overlayColor: HelperFunctions.isDarkMood(context)
                    ? MyColor.white
                    : MyColor.black,
              ),
            ),
            const SizedBox(
              height: Sizes.spaceBtwItems / 2,
            ),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   BrandTitleTextWithVerifiedIcon(
                    title: brand.name,
                    textSize: TextSizes.large,
                  ),
                  Text(
                    '${brand.productCount ?? 0} products',
                    style: Theme.of(context).textTheme.labelMedium,
                    overflow: TextOverflow.ellipsis,
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
