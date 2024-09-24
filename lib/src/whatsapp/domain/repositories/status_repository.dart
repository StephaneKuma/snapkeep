import 'package:snapkeep/src/core/types/index.dart';
import 'package:snapkeep/src/whatsapp/domain/entities/status.dart';

abstract class StatusRepository {
  FutureResult<Stream<List<Status>>> images();

  FutureResult<Stream<List<Status>>> videos();

  FutureResult<bool> store({required String path});

  FutureResult<bool> destroy({required String path});
}
