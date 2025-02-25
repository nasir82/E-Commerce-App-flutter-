import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_e_commerce_app/features/shop/models/category_model.dart';
import 'package:flutter_e_commerce_app/utils/exceptions/exceptions.dart';
import 'package:get/get.dart';

class CategoryRepository extends GetxController{

  static CategoryRepository get instance => Get.find();
  // variables
  final _db =  FirebaseFirestore.instance;


  //get all categories

  Future<List<CategoryModel>> getAllCategory() async{

    try {

      final snapshots = await _db.collection("Categories").get();
      final list = snapshots.docs.map((e)=> CategoryModel.fromSnapshot(e)).toList();
      print(" #####list size ${list.length} #########");
      
      return list;
      
    }on FirebaseException catch(e){
      throw FirebaseExceptionsCustom(e.code).message;
    }
     catch (e) {
      throw "Something went wrong. $e";
    }
  }

  // get sub categories

  Future<List<CategoryModel>> getSubCategories(String categoryId) async{

    try {

      final snapshots = await _db.collection("Categories").where('ParentId', isEqualTo: categoryId).get();
      final list = snapshots.docs.map((e)=> CategoryModel.fromSnapshot(e)).toList();
      print(" #####list size ${list.length} #########");
      
      return list;
      
    }on FirebaseException catch(e){
      throw FirebaseExceptionsCustom(e.code).message;
    }
     catch (e) {
      throw "Something went wrong. $e";
    }
  }


  /// upload categories

}