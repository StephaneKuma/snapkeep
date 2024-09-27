// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:injectable/injectable.dart';

import 'package:snapkeep/src/core/types/index.dart';
import 'package:snapkeep/src/core/usecases/usecase.dart';
import 'package:snapkeep/src/whatsapp/domain/entities/status.dart';
import 'package:snapkeep/src/whatsapp/domain/repositories/status_repository.dart';

@lazySingleton
class LoadStatuses implements UseCase<List<Status>, LoadStatusParam> {
  final StatusRepository repository;

  LoadStatuses({required this.repository});

  @override
  FutureResult<List<Status>> call({required LoadStatusParam param}) async {
    return await (param.stored
        ? repository.storedStatuses(
            path: param.path,
          )
        : repository.statuses(
            path: param.path,
            isVideo: param.isVideo,
          ));
  }
}

class LoadStatusParam {
  final String path;
  bool stored;
  bool isVideo;

  LoadStatusParam({
    required this.path,
    this.stored = false,
    this.isVideo = false,
  });
}
