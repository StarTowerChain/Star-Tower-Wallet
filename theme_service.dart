import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

const bool defaultDarkMode = false;
class ThemeService {
  final _getStorage = GetStorage();
  final storageKey = 'isDarkMode';

  ThemeMode get theme => isDarkMode() ? ThemeMode.dark : ThemeMode.light;

  bool isDarkMode(){
    return _getStorage.read(storageKey) ?? defaultDarkMode;
  }

  reset() {
    Get.changeThemeMode(ThemeMode.light);
    _getStorage.write(storageKey, defaultDarkMode);
  }

  void saveThemeMode(bool isDarkMode){
    _getStorage.write(storageKey, isDarkMode);
  }

  void changeThemeMode(){
    Get.changeThemeMode(isDarkMode() ? ThemeMode.light : ThemeMode.dark);
    saveThemeMode(!isDarkMode());
  }
}