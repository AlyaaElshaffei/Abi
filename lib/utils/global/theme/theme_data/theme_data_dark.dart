import 'package:flutter/material.dart';
import 'package:myapp/utils/app_constants.dart';

import 'package:myapp/utils/global/theme/app_color/app_color_dark.dart';

ThemeData getThemeDataDart() => ThemeData(

  brightness: Brightness.dark,
  primaryColor: AppColorDark.primaryColor,
  scaffoldBackgroundColor: AppColorDark.scaffoldBackgroundColor,


  bottomNavigationBarTheme:
   const BottomNavigationBarThemeData(
     selectedItemColor: Colors.black,
              type: BottomNavigationBarType.fixed,
              backgroundColor:
              AppColorDark.bottomNavBarBackgroundColor,
              elevation: 2,
              selectedLabelStyle: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: AppConstants.s16,
              ),
   ),


   appBarTheme: const AppBarTheme(
    iconTheme: const IconThemeData(
  color: AppColorDark.iconColor,
  size: AppConstants.s16,

),
    elevation: 0.0,
    backgroundColor: AppColorDark.appBarBackgroundColor,
    titleTextStyle: TextStyle(
      color:AppColorDark.titleTextColor,
      fontSize: AppConstants.s18,
    )
   ),

dividerColor: AppColorDark.dividerColor,
   
   iconTheme: const IconThemeData(
  color: AppColorDark.iconColor,
  size: AppConstants.s16,

)

);
