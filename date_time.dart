import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'object_util.dart';

class TimeUtil{
  static TimeOfDay? stringConvertToTimeOfDay(String? string) {
    if (ObjectUtil.isEmptyString(string)) return null;

    List<String> items = string!.split(":");
    if (ObjectUtil.isEmptyList(items)) return null;

    if (items.length != 2) return null;

    TimeOfDay? timeOfDay;
    try {
      timeOfDay =
          TimeOfDay(hour: int.parse(items[0]), minute: int.parse(items[1]));
    } catch (e) {
      timeOfDay = null;
    }
    return timeOfDay;
  }

  static String? timeOfDayConvertToString(TimeOfDay? timeOfDay) {
    if (timeOfDay == null) return null;

    String? hourString;
    if (timeOfDay.hour < 10) {
      hourString = "0" + "${timeOfDay.hour}";
    } else {
      hourString = "${timeOfDay.hour}";
    }

    String? minuteString;
    if (timeOfDay.minute < 10) {
      minuteString = "0" + "${timeOfDay.minute}";
    } else {
      minuteString = "${timeOfDay.minute}";
    }

    return hourString + ":" + minuteString;
  }

  static String formatTime({String? formatter, DateTime? time}) {
    String formatterString =
    ObjectUtil.isEmptyString(formatter) ? "yyyy.MM.dd HH:mm:ss" : formatter!;

    var dateFormatter = DateFormat(formatterString);

    return dateFormatter.format(time ?? DateTime.now());
  }

  static DateTime? stringToDateTime(String dateString) {
    String formattedString = dateString.replaceAll(".", "-");

    DateTime? dateTime;
    try {
      dateTime = DateTime.parse(formattedString);
    } catch (e) {
      dateTime = null;
    }
    return dateTime;
  }

//计算两个日期相差多少天
  static int diffdaysBetweenTwoDate(DateTime startDate, DateTime endDate) {
    return endDate.difference(startDate).inDays;
  }

  ///补零
  static String zeroFill(int i) {
    return i >= 10 ? "$i" : "0$i";
  }
}