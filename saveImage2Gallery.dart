import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:permission_handler/permission_handler.dart';

import 'capture.dart';
import 'toast.dart';

saveImage2Gallery(GlobalKey key) async {
  Uint8List uint8List = await captureImageData(key);
  if (Platform.isAndroid && !(await Permission.storage.isGranted)) {
    await Permission.storage.request();
  }
  final result = await ImageGallerySaver.saveImage(uint8List, quality: 100);
  if (result != null) {
    showToast('saveSuccess'.tr);
  }
}
