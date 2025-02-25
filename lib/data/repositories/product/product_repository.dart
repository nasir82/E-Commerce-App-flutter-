import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_e_commerce_app/features/shop/models/product_model.dart';
import 'package:flutter_e_commerce_app/utils/exceptions/exceptions.dart';
import 'package:get/get.dart';

class ProductRepository extends GetxController {
  static ProductRepository get instance => Get.find();
  final db = FirebaseFirestore.instance;

  // get limited feature product

  Future<List<ProductModel>> getFeatureProduct() async {
    try {
      final snapshot = await db
          .collection("Products")
          .where('isFeatured', isEqualTo: true)
          .limit(4)
          .get();

      return snapshot.docs.map((e)=> ProductModel.fromSnapshot(e)).toList();
    } on FirebaseException catch (e) {
      throw FirebaseExceptionsCustom(e.code).message;
    } catch (e) {
     // print('############################ ${e.toString()}  ####');
      throw e.toString();
    }
  }
  Future<List<ProductModel>> getAllFeatureProduct() async {
    try {
      final snapshot = await db
          .collection("Products")
          .where('isFeatured', isEqualTo: true)
          .get();

      return snapshot.docs.map((e)=> ProductModel.fromSnapshot(e)).toList();
    } on FirebaseException catch (e) {
      throw FirebaseExceptionsCustom(e.code).message;
    } catch (e) {
     // print('############################ ${e.toString()}  ####');
      throw e.toString();
    }
  }



  Future<List<ProductModel>> getProductByQuery(Query query) async {
    try {
      final snapshot = await query.get();
     // final List<ProductModel> productList = snapshot.docs.map((toElement) => ProductModel.fromSnapshot(toElement)).toList();
      return snapshot.docs.map((e)=> ProductModel.fromQuerySnapshot(e)).toList();
    } on FirebaseException catch (e) {
      throw FirebaseExceptionsCustom(e.code).message;
    } catch (e) {
      //print('############################ ${e.toString()}  ####');
      throw e.toString();
    }
  }
  Future<List<ProductModel>> getFavouriteProducts(List<String> productIds) async {
    try {
      final snapshot = await db.collection("Products").where(FieldPath.documentId, whereIn: productIds).get();
     // final List<ProductModel> productList = snapshot.docs.map((toElement) => ProductModel.fromSnapshot(toElement)).toList();
      return snapshot.docs.map((e)=> ProductModel.fromQuerySnapshot(e)).toList();
    } on FirebaseException catch (e) {
      throw FirebaseExceptionsCustom(e.code).message;
    } catch (e) {
      //print('############################ ${e.toString()}  ####');
      throw e.toString();
    }
  }


  Future<List<ProductModel>> getBrandProduct({required String brandId, int limit = -1})async{
    try {
    final querySnap = limit == -1 ? await db.collection("Products").where('Brand.Id', isEqualTo: brandId).get() : await db.collection("Products").where('Brand.Id', isEqualTo: brandId).limit(limit).get();
    final products = querySnap.docs.map((doc)=> ProductModel.fromSnapshot(doc)).toList();
    return products;
    } on FirebaseException catch (e) {
      throw FirebaseExceptionsCustom(e.code).message;
    } catch (e) {
      //print('############################ ${e.toString()}  ####');
      throw e.toString();

    }
  }
  Future<List<ProductModel>> getAllCategoryProducts({required String categoryId, int limit = -1})async{
    try {
    final querySnap = limit == -1 ? await db.collection("Products").where('Brand.Id', isEqualTo: categoryId).get() : await db.collection("Products").where('Brand.Id', isEqualTo: categoryId).limit(limit).get();
    final products = querySnap.docs.map((doc)=> ProductModel.fromSnapshot(doc)).toList();
    print("#############\n length = ${products.length} and $categoryId \n ########");
    return products;
    } on FirebaseException catch (e) {
      throw FirebaseExceptionsCustom(e.code).message;
    } catch (e) {
      //print('############################ ${e.toString()}  ####');
      throw e.toString();

    }
  }



  /// upload dummy data
  ///
  ///
  ///
}
