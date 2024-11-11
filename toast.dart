import 'package:cherry_flutter/cherry_flutter.dart';
import 'package:flutter/material.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

void showToast(String? text, [int seconds = 2]) {
  BotToast.showText(
    text: text ?? ' ',
    duration: Duration(seconds: seconds),
    textStyle: TextStyle(fontSize: 24.sp, color: Colors.white),
    contentColor: const Color(0xff222222),
  );
}

CancelFunc showLoading({String? text}) {
  return BotToast.showCustomLoading(
    backgroundColor: Colors.transparent,
    toastBuilder: (void Function() cancelFunc) {
      return CHFLoading(content: text ?? '加载中..');
    },
  );
}

void showSnackBar({String? content}) {
  Get.showSnackbar(
    GetSnackBar(
      messageText: Container(
        alignment: Alignment.center,
        child: Text(
          content ?? '',
          style: const TextStyle(color: Colors.white),
        ),
      ),
      backgroundColor: const Color(0xff222222),
      snackPosition: SnackPosition.TOP,
      duration: const Duration(milliseconds: 1000),
      snackStyle: SnackStyle.GROUNDED,
    ),
  );
}
