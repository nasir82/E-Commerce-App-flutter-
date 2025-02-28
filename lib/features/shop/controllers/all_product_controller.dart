import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_e_commerce_app/data/repositories/product/product_repository.dart';
import 'package:flutter_e_commerce_app/features/shop/models/product_model.dart';
import 'package:flutter_e_commerce_app/utils/loader/loader.dart';
import 'package:get/get.dart';

class AllProductController extends GetxController {
  static AllProductController get instance => Get.find();

  final repository = ProductRepository.instance;
  final RxString selectedOption = 'Name'.obs;
  final RxList<ProductModel> products = <ProductModel>[].obs;

  Future<List<ProductModel>> fetchProductByQuery(Query? query) async {
    try {
      if (query == null) return [];
      final products = await repository.getProductByQuery(query);
      return products;
    } catch (e) {
      Loaders.errorSnackbar(title: "Oh chorry", message: e.toString());
      return [];
    }
  }

  void sortProducts(String shortOption){
    selectedOption.value = shortOption;

    switch(shortOption){
      case 'Name':
      products.sort((a,b)=> a.title.compareTo(b.title));
      break;
      case 'Higher Price':
      products.sort((a,b)=> b.price.compareTo(a.price));
      break;
      case 'Lower Price':
      products.sort((a,b)=> a.price.compareTo(b.price));
      break;
      case 'Newest':
      products.sort((a,b)=> a.date!.compareTo(b.date!));
      break;
      case 'Sale':
      products.sort((a,b){
          if(b.salePrice>0){
            return b.salePrice.compareTo(a.salePrice);
          }else if(a.salePrice>0){
            return -1;
          }else{
            return 1;
          }
      }) ;
      break;
      default:
      products.sort((a,b)=> a.title.compareTo(b.title));

    }
  }

  void assignAll(List<ProductModel> products){
    this.products.assignAll(products);
    sortProducts("Name");
  }
}
