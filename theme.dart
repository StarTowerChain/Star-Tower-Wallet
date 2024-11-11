import 'package:flutter/material.dart';

class Themes {
  // 抽取相同样式
  // static const double _titleFontSize = 20;

  static final ThemeData lightTheme = ThemeData(
      primaryColor: const Color(0xff667DF6),
      visualDensity: VisualDensity.adaptivePlatformDensity,
      scaffoldBackgroundColor: const Color(0xffF9F8FD),
      appBarTheme: const AppBarTheme(backgroundColor: Color(0xffF9F8FD)),
      iconTheme: const IconThemeData(color: Colors.white),
      textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
        overlayColor: MaterialStateProperty.all(Colors.grey[200]),
        padding: MaterialStateProperty.all(EdgeInsets.zero),
      )));

  static final ThemeData darkTheme = ThemeData(
      primaryColor: const Color(0xff667DF6),
      visualDensity: VisualDensity.adaptivePlatformDensity,
      scaffoldBackgroundColor: const Color(0xff20232C),
      iconTheme: const IconThemeData(color: Colors.white),
      popupMenuTheme: PopupMenuThemeData(
        color: const Color(0xff2B2C31).withOpacity(0.9),
      ));
}
