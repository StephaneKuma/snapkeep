import 'package:injectable/injectable.dart';
import 'package:snapkeep/src/core/types/index.dart';
import 'package:snapkeep/src/core/usecases/usecase.dart';
import 'package:snapkeep/src/whatsapp/domain/entities/status.dart';
import 'package:snapkeep/src/whatsapp/domain/repositories/status_repository.dart';

@lazySingleton
class LoadStatusImages implements UseCase<Stream<List<Status>>, NoParams> {
  final StatusRepository repository;

  LoadStatusImages({required this.repository});

  @override
  FutureResult<Stream<List<Status>>> call({required NoParams params}) async {
    return await repository.images();
  }
}

class NoParams {}
