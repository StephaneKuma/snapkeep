import 'package:injectable/injectable.dart';
import 'package:snapkeep/src/core/types/index.dart';
import 'package:snapkeep/src/core/usecases/usecase.dart';
import 'package:snapkeep/src/whatsapp/domain/repositories/status_repository.dart';

@lazySingleton
class StoreStatus implements UseCase<void, StoreStatusParams> {
  final StatusRepository repository;

  StoreStatus({required this.repository});

  @override
  FutureResult<bool> call({required StoreStatusParams params}) async {
    return await repository.store(
      path: params.path,
    );
  }
}

class StoreStatusParams {
  final String path;

  StoreStatusParams({required this.path});
}
