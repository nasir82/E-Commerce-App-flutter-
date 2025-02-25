import 'package:flutter/material.dart';
import 'package:flutter_e_commerce_app/features/shop/models/category_model.dart';
import 'package:flutter_e_commerce_app/features/store/controller/brand_controller.dart';
import 'package:flutter_e_commerce_app/features/store/store.dart';

class CategoryBrands extends StatelessWidget {
  const CategoryBrands({super.key, required this.category});

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    final controller = BrandController.instance;

    return FutureBuilder(
        future: controller.getBrandsForCategory(category.id),
        builder: (context, snapshot) {
          // const loader = Column(
          //   children: [
          //     //list tile shimmer

          //     // size box

          //     // box shimmer
          //   ],
          // );
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (!snapshot.hasData ||
              snapshot.hasError ||
              snapshot.data!.isEmpty) {
            return const Center(
              child: Text("No showcase Data Found"),
            );
          }
          final brands = snapshot.data!;

          return ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: brands.length,
              itemBuilder: (context, index) {
                final brand = brands[index];
                return FutureBuilder(
                    future:
                        controller.getBrandProduct(brandId: brand.id, limit: 3),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }

                      if (!snapshot.hasData ||
                          snapshot.hasError ||
                          snapshot.data!.isEmpty) {
                        return const Center(
                          child: Text("No Data Found"),
                        );
                      }

                      final products = snapshot.data!;
                      return BrandShowCase(
                        images: products.map((e)=> e.thumbnail).toList(),
                        brand: brand,
                      );
                    });
              });
        });
  }
}
