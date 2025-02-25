// import 'package:flutter/material.dart';
// import 'package:flutter_e_commerce_app/commons/widgets/appbar/appbar.dart';
// import 'package:flutter_e_commerce_app/commons/widgets/images/rounded_image.dart';
// import 'package:flutter_e_commerce_app/commons/widgets/products/product_cards/product_cart_horizontal.dart';
// import 'package:flutter_e_commerce_app/features/authentications/screens/home/widgets/section_heading.dart';
// import 'package:flutter_e_commerce_app/features/shop/models/category_model.dart';
// import 'package:flutter_e_commerce_app/features/shop/models/product_model.dart';
// import 'package:flutter_e_commerce_app/utils/constants/image_strings.dart';
// import 'package:flutter_e_commerce_app/utils/constants/sizes.dart';

// class SubcatagoryScreen extends StatelessWidget {
//   const SubcatagoryScreen({super.key, required this.category});

//   final CategoryModel category;
//   @override
//   Widget build(BuildContext context) {
//     return  Scaffold(
//       appBar:  MyAppBar(
//                   title: Text(
//                     category.name,
//                     style: Theme.of(context).textTheme.headlineMedium,
//                   ),
//                   showBackArrow: true,
//                 ),

//       body:  SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(Sizes.defaultSpace),
//           child: Column(
//             children: [
//               const RoundedImage(imageUrl: ImageString.products,width: double.infinity,
//               applyImageRadius: true,
//               ),
//               const SizedBox(height: Sizes.spaceBtwSections,),
//               //sub catagories

//               Column(
//                 children: [
//                   SectionHeading(title: category.name,onPressed: (){},isShowButton: true,),
//                   SizedBox(
//                     height: 120,
//                     child: ListView.separated(
//                       shrinkWrap: true,
//                       scrollDirection: Axis.horizontal,
//                       separatorBuilder: (_,index)=> const SizedBox(width: Sizes.spaceBtwItems),
//                       itemCount: 10,
//                       itemBuilder:(_,indext)=>  ProductCartHorizontal(product: ProductModel.empty(),)
//                       ),
//                   ),
//                 ],
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }