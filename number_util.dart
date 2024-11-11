import 'dart:math';

import 'package:decimal/decimal.dart';
import 'package:number_display/number_display.dart';
final numberDisplay = createDisplay(length: 8);
class NumberUtil {
  static Decimal calculateNumber(BigInt number, int decimal) {
    if (number == BigInt.zero) return Decimal.zero;
    if (decimal == 0) return Decimal.fromBigInt(number);
    return Decimal.fromBigInt(number) /
        Decimal.fromBigInt(BigInt.from(pow(10, decimal)));
  }

  static BigInt hexToBigInt(String? hex) {
    if (hex == null) return BigInt.zero;
    return BigInt.tryParse(hex, radix: 16) ?? BigInt.zero;
  }
}
