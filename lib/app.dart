import 'package:flutter/material.dart';
import 'package:flutter_e_commerce_app/bindings/general_bindings.dart';
import 'package:flutter_e_commerce_app/routes/app_routes.dart';
import 'package:flutter_e_commerce_app/utils/constants/color.dart';
import 'package:flutter_e_commerce_app/utils/theme/theme.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  GetMaterialApp(
      themeMode: ThemeMode.system,
      theme: AppTheme.lightTheme,
      debugShowCheckedModeBanner: false,
      initialBinding: GeneralBindings(),
      darkTheme: AppTheme.darkTheme,
      getPages: AppRoutes.pages,
      home: const Scaffold(
        backgroundColor: MyColor.primaryColor,body: Center(
          child: CircularProgressIndicator(
            color: Colors.white,
          ),
        ),)
      
      //const OnBoardingScreen()
    );
  }
}
