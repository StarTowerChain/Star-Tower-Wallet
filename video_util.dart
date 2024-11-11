import 'dart:io';
import 'dart:typed_data';

import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:video_thumbnail/video_thumbnail.dart';

/// 获取视频封面
Future<String> getVideoThumbnail(XFile videoFile) async {
  Uint8List? tempthumbnail = await VideoThumbnail.thumbnailData(
    video: videoFile.path,
    imageFormat: ImageFormat.JPEG,
    quality: 25,
  );
  var tempDir = await getTemporaryDirectory();
  //生成file文件格式
  String videoThumbnail =
      '${tempDir.path}/image_${DateTime.now().millisecond}.jpg';

  File file = await File(videoThumbnail).create();
  file.writeAsBytesSync(tempthumbnail!);
  return videoThumbnail;
}
