import 'package:flutter/services.dart';

class VideoThumbnail {
  static const MethodChannel platform =
      MethodChannel('com.stephanekuma.snapkeep');

  static Future<String?> videoThumbnailPath({required String videoPath}) async {
    try {
      final String? thumbnailPath = await platform.invokeMethod<String>(
        'getVideoThumbnailPath',
        {'videoPath': videoPath},
      );
      return thumbnailPath;
    } on PlatformException catch (e) {
      throw Exception(e.message);
    }
  }
}
