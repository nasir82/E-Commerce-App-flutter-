import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_e_commerce_app/features/shop/models/brand_model.dart';
import 'package:flutter_e_commerce_app/utils/exceptions/exceptions.dart';
import 'package:get/get.dart';

class BrandRepository extends GetxController{

  static BrandRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  //get all category

  Future<List<BrandModel>> getAllBrand() async{
      try {
      final snapshot = await _db.collection("Brands").get();
      final result = snapshot.docs.map((doc)=> BrandModel.fromSnapshot(doc)).toList();
      return result;
    } on FirebaseException catch (e) {
      throw FirebaseExceptionsCustom(e.code).message;
    } catch (e) {
      throw "Something went wrong. Please try again";
    }
  }

  // get brand for category

  // this is for getting brand based on different category 
  // let say for sports shoes category there are many brand like nike, air
  
 Future<List<BrandModel>> getBrandsForCategory(String categoryId) async{
      try {
      QuerySnapshot brandCategoryQuery = await _db.collection('BrandCategory').where('categoryId', isEqualTo: categoryId).get();
      List<String> brands = brandCategoryQuery.docs.map((doc)=> doc['brandId'] as String).toList();
      final brandsQuery  = await _db.collection("Brands").where(FieldPath.documentId, whereIn: brands).limit(2).get();
      List<BrandModel> result = brandsQuery.docs.map((doc)=> BrandModel.fromSnapshot(doc)).toList();
      return result;
    } on FirebaseException catch (e) {
      throw FirebaseExceptionsCustom(e.code).message;
    } catch (e) {
      throw "Something went wrong. Please try again";
    }
  }

}