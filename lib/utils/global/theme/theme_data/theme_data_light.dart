import 'package:flutter/material.dart';
import 'package:myapp/utils/app_constants.dart';
import 'package:myapp/utils/global/theme/app_color/app_color_light.dart';

ThemeData getThemeDataLight() => ThemeData(
   brightness: Brightness.light,
  primaryColor: AppColorLight.primaryColor,
  scaffoldBackgroundColor: AppColorLight.scaffoldBackgroundColor,


  bottomNavigationBarTheme:
   const BottomNavigationBarThemeData(
     selectedItemColor: Colors.white,
              type: BottomNavigationBarType.fixed,
              backgroundColor:
              AppColorLight.bottomNavBarBackgroundColor,
              elevation: 2,
              selectedLabelStyle: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: AppConstants.s16,
              ),
   ),


   appBarTheme: const AppBarTheme(
    iconTheme: const IconThemeData(
  color: AppColorLight.iconColor,
  size: AppConstants.s16,

),
    elevation: 0,
    backgroundColor: AppColorLight.appBarBackgroundColor,
    titleTextStyle: TextStyle(
      color:AppColorLight.titleTextColor,
      fontSize: AppConstants.s18,
    )
   ),

dividerColor: AppColorLight.dividerColor,
iconTheme: const IconThemeData(
  color: AppColorLight.iconColor,
  size: AppConstants.s16,

)
   

);
