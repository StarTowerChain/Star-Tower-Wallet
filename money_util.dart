
import 'package:get/get.dart';

class MoneyUtils {
  static String unitConvert(num number) {
    var moneyUnits = ["", "w4", "w5", "w6"];
    num dividend = 10000;
    num currentNum = number;
    //转换数字
    var currentUnit = moneyUnits[0].tr;
    //转换单位
    for (var i = 0; i < 4; i++) {
      currentUnit = moneyUnits[i].tr;
      if (strNumSize(currentNum) < 5) {
        break;
      }
      currentNum = currentNum / dividend;
    }
    return currentNum.toStringAsFixed(2) + currentUnit;
  }

  static int strNumSize(num tempNum) {
    var stringNum = tempNum.toString();
    var index = stringNum.indexOf(".");
    var newNum = stringNum;
    if (index != -1) {
      newNum = stringNum.substring(0, index);
    }
    return newNum.length;
  }
}
