import 'package:snapkeep/src/core/types/index.dart';
import 'package:snapkeep/src/whatsapp/domain/entities/status.dart';

abstract class StatusRepository {
  FutureResult<List<Status>> statuses({
    required String path,
    bool stored = false,
    bool isVideo = false,
  });

  FutureResult<List<Status>> storedStatuses({required String path});
}
