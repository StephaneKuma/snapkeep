import 'package:injectable/injectable.dart';
import 'package:snapkeep/src/core/types/index.dart';
import 'package:snapkeep/src/core/usecases/usecase.dart';
import 'package:snapkeep/src/whatsapp/domain/repositories/status_repository.dart';

@lazySingleton
class DestroyStatus implements UseCase<void, DestroyStatusParams> {
  final StatusRepository repository;

  DestroyStatus({required this.repository});

  @override
  FutureResult<bool> call({required DestroyStatusParams params}) async {
    return await repository.store(
      path: params.path,
    );
  }
}

class DestroyStatusParams {
  final String path;

  DestroyStatusParams({required this.path});
}
