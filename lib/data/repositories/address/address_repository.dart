import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_e_commerce_app/data/repositories/address/address_model.dart';
import 'package:flutter_e_commerce_app/data/repositories/authentication/authentication_repository.dart';
import 'package:get/get.dart';

class AddressRepository extends GetxController{

  static AddressRepository get instance => Get.find();
  final db = FirebaseFirestore.instance;

  Future<List<AddressModel>> fetchUserAddresses() async{
    try {
      final userId = AuthenticationRepository.instance.authUser!.uid;
      if(userId.isEmpty) throw "Unable to find user informations. Try againg in a few minutes";
      final result = await db.collection("Users").doc(userId).collection("Addresses").get();
     final results = result.docs.map((address)=> AddressModel.fromDocumentSnapshot(address)).toList();
      print("################\n address  $results.length ");
     return results;
    } catch (e) {
       // print("################\n address  erorrs occur ${e.toString()} ");
      return [];
    }
  }


  Future<void> updateSelectedField(String addressId, bool selected) async{
    try {
      final userId = AuthenticationRepository.instance.authUser!.uid;

      await db.collection("Users").doc(userId).collection("Addresses").doc(addressId).update({'SelectedAddress':selected});
      print("update in repo");
    } catch (e) {
      print("error in repo  ${e.toString()}");
      throw 'Unable to update your selection. Try again';
    }
  }

  Future<String> addAddress(AddressModel address) async{
    try {
      final userId = AuthenticationRepository.instance.authUser!.uid;
      final currentAddress  = await db.collection("Users").doc(userId).collection("Addresses").add(address.toJson());
      return currentAddress.id;
    } catch (e) {
      throw 'Something went wrong';
      
    }
  }
}