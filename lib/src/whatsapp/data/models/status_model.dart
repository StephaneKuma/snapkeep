import 'package:snapkeep/src/whatsapp/domain/entities/status.dart';

class StatusModel extends Status {
  const StatusModel({
    required super.path,
    required super.isVideo,
  });

  StatusModel copyWith({
    String? path,
    bool? isVideo,
  }) {
    return StatusModel(
      path: path ?? this.path,
      isVideo: isVideo ?? this.isVideo,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'path': path,
      'isVideo': isVideo,
    };
  }

  factory StatusModel.fromMap({required Map<String, dynamic> map}) {
    return StatusModel(
      path: map['path'] as String,
      isVideo: map['isVideo'] as bool,
    );
  }
}
