import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

Future<Uint8List> captureImageData(GlobalKey globalKey, [double pixelRatio = 1]) async {
  RenderRepaintBoundary? boundary = globalKey.currentContext!.findRenderObject() as RenderRepaintBoundary?;
  ui.Image? image = await boundary?.toImage(pixelRatio: pixelRatio);
  ByteData? byteData = await image?.toByteData(format: ui.ImageByteFormat.png);
  Uint8List pngBytes = byteData!.buffer.asUint8List();
  return pngBytes;
}