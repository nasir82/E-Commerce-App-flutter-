
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

class HelperFunctions {
 static Color? getColor(String color) {
  switch (color.toLowerCase()) {
    case 'red':
      return Colors.red;
    case 'green':
      return Colors.green;
    case 'blue':
      return Colors.blue;
    case 'yellow':
      return Colors.yellow;
    case 'orange':
      return Colors.orange;
    case 'purple':
      return Colors.purple;
    case 'pink':
      return Colors.pink;
    case 'brown':
      return Colors.brown;
    case 'grey':
      return Colors.grey;
    case 'black':
      return Colors.black;
    case 'white':
      return Colors.white;
    case 'cyan':
      return Colors.cyan;
    case 'indigo':
      return Colors.indigo;
    case 'lime':
      return Colors.lime;
    case 'teal':
      return Colors.teal;
    case 'amber':
      return Colors.amber;
    case 'deeporange':
      return Colors.deepOrange;
    case 'deeppurple':
      return Colors.deepPurple;
    case 'lightblue':
      return Colors.lightBlue;
    case 'lightgreen':
      return Colors.lightGreen;
    case 'bluegrey':
      return Colors.blueGrey;
    default:
      return null;
  }
}


  static void showSnackBar(String message) {
    ScaffoldMessenger.of(Get.context!)
        .showSnackBar(SnackBar(content: Text(message)));
  }

  static void showAlert(String title, String message) {
    showDialog(
        context: Get.context!,
        builder: (context) {
          return AlertDialog(
            title: Text(title),
            content: Text(message),
            actions: [
              TextButton(onPressed: (){
                  Navigator.of(context).pop();
              }, child: const Text("Ok"))
            ],
          );
        });
  }

  static void navigateToScreen(BuildContext context,Widget screen){

    Navigator.push(context, MaterialPageRoute(builder: (_)=>screen));
  }

  static String trancateText(String text,int maxLen){

     if(text.length<=maxLen){
      return text;
     }else{
      return '${text.substring(0,maxLen)}...';
     }
  }

  static bool isDarkMood(BuildContext context){
    return Theme.of(context).brightness==Brightness.dark;
  }
  static Size screenSize(){
    return MediaQuery.of(Get.context!).size;
  }
  static double getScreenWidth(){
    return MediaQuery.of(Get.context!).size.width;
  }
  static double getScreenHeight(){
    return MediaQuery.of(Get.context!).size.height;
  }

  static List<T> removeDuplicates<T>(List<T> list){
    return list.toSet().toList();
  }

  static List<Widget> wrapWidgets(List<Widget> widgetList,int rowSize){

    final wrappedList = <Widget>[];
    for(var i = 0;i<widgetList.length;i+rowSize){
      final rowChildren = widgetList.sublist(i,i+rowSize> widgetList.length ? widgetList.length : i+rowSize);
      wrappedList.add(Row(children: rowChildren,));
    }

    return wrappedList;
  }
}
