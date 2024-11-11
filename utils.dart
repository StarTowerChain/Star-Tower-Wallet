import 'dart:math';
import 'package:flutter/services.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:url_launcher/url_launcher.dart';
import 'toast.dart';

Future<void> launchURL(String url) async {
  if (await canLaunchUrl(Uri.parse(url))) {
    await launchURL(url);
  } else {
    print('launch error');
  }
}

void handlerCopy(String? text, {String? successText}) {
  if (text == null) return;
  Clipboard.setData(ClipboardData(text: text));
  showToast(successText ?? 'copyTips'.tr);
}

String hideString(String? str, int start, int end,
    {String hideText = '*', int maxHideLength = 3}) {
  if (str == null) return '';
  start = max(0, start);
  start = min(start, str.length - 1);

  end = max(0, end);
  end = min(end, str.length - 1);

  final s = min(start, end);
  final e = max(start, end);

  return str.substring(0, s) +
      List.filled(e - s > maxHideLength ? maxHideLength : e - s, hideText)
          .join() +
      str.substring(e);
}
