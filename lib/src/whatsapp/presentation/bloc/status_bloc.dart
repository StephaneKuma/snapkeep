import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:snapkeep/src/core/errors/failure.dart';
import 'package:snapkeep/src/whatsapp/domain/entities/status.dart';
import 'package:snapkeep/src/whatsapp/domain/usecases/destroy_status.dart';
import 'package:snapkeep/src/whatsapp/domain/usecases/load_status_images.dart';
import 'package:snapkeep/src/whatsapp/domain/usecases/load_status_videos.dart';
import 'package:snapkeep/src/whatsapp/domain/usecases/store_status.dart';

part 'status_event.dart';
part 'status_state.dart';

@lazySingleton
final class StatusBloc extends Bloc<StatusEvent, StatusState> {
  final LoadStatusImages _loadStatusImages;
  final LoadStatusVideos _loadStatusVideos;

  StatusBloc({
    required LoadStatusImages loadStatusImages,
    required LoadStatusVideos loadStatusVideos,
    required StoreStatus storeStatus,
    required DestroyStatus destroyStatus,
  })  : _loadStatusImages = loadStatusImages,
        _loadStatusVideos = loadStatusVideos,
        super(StatusInitial()) {
    on<StatusEvent>((_, emit) => emit(LoadingStatus()));

    on<FetchStatus>(_onLoadStatusImages);
  }

  void _onLoadStatusImages(
    FetchStatus event,
    Emitter<StatusState> emit,
  ) async {
    final result = await _loadStatusImages.call();

    result.fold(
      (Failure failure) => emit(
        StatusLoadFailure(message: failure.message),
      ),
      (List<Status> statuses) => emit(
        StatusLoaded(statuses: statuses),
      ),
    );
  }
}
