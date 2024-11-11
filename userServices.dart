import 'dart:convert';
import 'dart:ffi';

import 'package:collection/collection.dart';
import 'package:shared_preferences/shared_preferences.dart';
import "./storage.dart";

class UserServices {
  //获取用户信息
  static Future getUserInfo() async {
    Map? userInfo = await Storage.getData("userinfo");
    print("获取用户的登录信息: $userInfo");
    if (userInfo != null) {
      return userInfo;
    } else {
      return {};
    }
  }

  //判断是否登录
  static Future<bool> getUserLoginState() async {
    Map<String, dynamic> userInfo = await getUserInfo();

    if (userInfo.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }

  static  loginOut() async{
    Storage.removeData("userinfo");
  }
}