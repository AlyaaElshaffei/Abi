

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:myapp/utils/global/theme/theme_data/theme_data_dark.dart';
import 'package:myapp/utils/global/theme/theme_data/theme_data_light.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'theme_cubit_state.dart';

class ThemeCubitCubit extends Cubit<ThemeData> {
  ThemeCubitCubit() : super(getThemeDataLight()){
    _getThemeFromPrefs();
  }

  Future<void> _saveThemePrefs(Brightness brightness) async {
    final themeIndex = brightness == Brightness.light ? 0 : 1;
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setInt("theme", themeIndex);
    debugPrint("theme saved");
  }

  Future<void> _getThemeFromPrefs() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    final saveThemeIndex = sharedPreferences.getInt("theme");
    final savedTheme =
        saveThemeIndex == 0 ? getThemeDataLight() : getThemeDataDart();
    emit(savedTheme);
    debugPrint("theme got");
  }

  void toggleTheme() {
    final newTheme = state.brightness == Brightness.light
        ? getThemeDataDart()
        : getThemeDataLight();
    emit(newTheme);
    _saveThemePrefs(newTheme.brightness);
     debugPrint("Toggle sucessfully");
  }
}
