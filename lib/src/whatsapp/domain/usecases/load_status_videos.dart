import 'package:injectable/injectable.dart';
import 'package:snapkeep/src/core/types/index.dart';
import 'package:snapkeep/src/core/usecases/usecase.dart';
import 'package:snapkeep/src/whatsapp/domain/entities/status.dart';
import 'package:snapkeep/src/whatsapp/domain/repositories/status_repository.dart';

@lazySingleton
class LoadStatusVideos implements UseCase<List<Status>, NoParams> {
  final StatusRepository repository;

  LoadStatusVideos({required this.repository});

  @override
  FutureResult<List<Status>> call({NoParams? params}) async {
    return await repository.images();
  }
}

class NoParams {}
