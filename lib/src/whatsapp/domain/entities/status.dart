import 'package:equatable/equatable.dart';

class Status extends Equatable {
  final String path;
  final bool isVideo;

  const Status({
    required this.path,
    required this.isVideo,
  });

  @override
  List<Object> get props => [path, isVideo];

  @override
  bool get stringify => true;
}
