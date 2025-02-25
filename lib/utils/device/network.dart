// import 'dart:async';

// import 'package:connectivity_plus/connectivity_plus.dart';
// import 'package:flutter/services.dart';
// import 'package:get/get.dart';

// class NetworkManager extends GetxController{

//   static NetworkManager get instance  => Get.find();


//   //final _connectivity  = Connectivity();

//   final _connectivity = Connectivity();

//   late StreamSubscription<ConnectivityResult> _connectionSubscription;
//   final Rx<ConnectivityResult> _connectionStatus = ConnectivityResult.none.obs;


//   @override
//   void onInit(){
//     super.onInit();
//     _connectionSubscription = _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
//   }

//   Future<void> _updateConnectionStatus(ConnectivityResult result) async{
//       _connectionStatus.value = result;
//       if(_connectionStatus.value == ConnectivityResult.none){
        
//       }
//   }

//   Future<bool> isConnected() async{
//       try{
//           final result = await _connectivity.checkConnectivity();
//           if(result == ConnectivityResult.none){
//             return false;

//           }else {
//             return true;
//           }
//       } on PlatformException catch(_){
//         return false;
//       }
//   }

// }