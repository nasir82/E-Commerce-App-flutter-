import 'package:flutter/material.dart';
import 'package:flutter_e_commerce_app/utils/theme/custom_themes/app_bar_theme.dart';
import 'package:flutter_e_commerce_app/utils/theme/custom_themes/bottomsheet_theme.dart';
import 'package:flutter_e_commerce_app/utils/theme/custom_themes/check_box_theme.dart';
import 'package:flutter_e_commerce_app/utils/theme/custom_themes/chip_theme.dart';
import 'package:flutter_e_commerce_app/utils/theme/custom_themes/elevated_button_theme.dart';
import 'package:flutter_e_commerce_app/utils/theme/custom_themes/text_field_theme.dart';
import 'package:flutter_e_commerce_app/utils/theme/custom_themes/text_theme.dart';

class AppTheme{

  AppTheme._();
  
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.light,
    primaryColor: Colors.blue,
    scaffoldBackgroundColor: Colors.white,
    textTheme: TextThemes.lightTheme,
    elevatedButtonTheme: MyElevatedButtonTheme.lightElevatedButtonTheme,
    appBarTheme: MyAppbarTheme.lightAppBarTheme,
    checkboxTheme: MyCheckBoxTheme.lightCheckBoxTheme,
    bottomSheetTheme: MyBottomSheetTheme.lightBottomSheetThemeData,
    inputDecorationTheme:MyTextFormFieldTheme.lightInputDecorationTheme,
    chipTheme: MyChipTheme.lightChipTheme
    
  );
  
  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.dark,
    primaryColor: Colors.blue,
    scaffoldBackgroundColor: Colors.black,
    textTheme: TextThemes.darkTheme,
    elevatedButtonTheme: MyElevatedButtonTheme.darkElevatedButtonTheme,
    appBarTheme: MyAppbarTheme.darkAppBarTheme,
    checkboxTheme: MyCheckBoxTheme.darkCheckBoxTheme,
    bottomSheetTheme: MyBottomSheetTheme.darkBottomSheetThemeData,
    inputDecorationTheme:MyTextFormFieldTheme.darkInputDecorationTheme,
    chipTheme: MyChipTheme.darkChipTheme
  );

}