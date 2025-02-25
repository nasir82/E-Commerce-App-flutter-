import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_e_commerce_app/data/repositories/authentication/authentication_repository.dart';
import 'package:flutter_e_commerce_app/features/shop/models/order_model.dart';
import 'package:get/get.dart';

class OrderRepository extends GetxController{
static OrderRepository get instance => Get.find();

// variables

final _db = FirebaseFirestore.instance;

//functions

Future<List<OrderModel>> fetchUserOrders() async{
  try {
    final userId = AuthenticationRepository.instance.authUser!.uid;
    if(userId.isEmpty) throw "Unable to find user information. Try again later";
    final result = await _db.collection("Users").doc(userId).collection("Orders").get();
    return result.docs.map((element)=> OrderModel.fromSnapshot(element)).toList();

  } catch (e) {
    throw "Unable to find user information. Try again later";
  }
}

Future<void> saveOrder(OrderModel order,String userId) async{
  try {
    await _db.collection("Users").doc(userId).collection("Orders").add(order.toJson());
  } catch (e) {
    print(e.toString());
    throw "Unable to save user information. Try again later";
  }
}
}