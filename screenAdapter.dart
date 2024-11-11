import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

//根据屏幕的宽高比例来返回对应的宽高，字体大小

class ScreenAdapter {
  static width(num v) {
    return v.w;
  }

  static height(num v) {
    return v.h;
  }

  static fontsize(num v) {
    return v.sp;
  }

  static getScreenWidth() {
    return 1.sw;
  }

  static getScreenHeight() {
    return 1.sh;
  }

//底部安全区距离，适用于全面屏下面有按键的
  static getBottomBarHeight() {
    return ScreenUtil().bottomBarHeight;
  }

//状态栏高度 刘海屏会更高
  static getStatusBarHeight() {
    return ScreenUtil().statusBarHeight;
  }

  static getBackgroundColor() {
    return const Color(0xFF100F15);
  }

  static getBorderBackgroundColor() {
    return const Color(0XFF1B1B27);
  }

  static getNavTitleColor() {
    return Color(0XFFFFFFFF);
  }

  //#
  static getNavTitleType1Color() {
    return Color(0XFF999999);
  }

  //#FF333333
  static getBottomLineTitleColor() {
    return Color(0XFF999999);
  }

  static getNavTopLeftButton(VoidCallback? onPressed) {
    return IconButton(
      icon: BackButtonIcon(),
      splashRadius: 25,
      color: Color(0xffffffff),
      onPressed: onPressed,
    );
  }

  static getNavTopNoneLeftButton(VoidCallback? onPressed) {
    return IconButton(
      icon: BackButtonIcon(),
      splashRadius: 25,
      color: Color(0x00ffffff),
      onPressed: onPressed,
    );
  }



}
