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
  final StoreStatus _storeStatus;
  final DestroyStatus _destroyStatus;

  StatusBloc({
    required LoadStatusImages loadStatusImages,
    required LoadStatusVideos loadStatusVideos,
    required StoreStatus storeStatus,
    required DestroyStatus destroyStatus,
  })  : _loadStatusImages = loadStatusImages,
        _loadStatusVideos = loadStatusVideos,
        _storeStatus = storeStatus,
        _destroyStatus = destroyStatus,
        super(StatusInitial()) {
    on<StatusEvent>((_, emit) => emit(LoadingStatus()));

    on<FetchStatusImages>(_onLoadStatusImages);
    on<FetchStatusVideos>(_onLoadStatusVideos);
    on<StoreStatusVideos>(_onStoreStatus);
    on<DestroyStatusVideos>(_onDestroyStatus);
  }

  void _onLoadStatusImages(
    FetchStatusImages event,
    Emitter<StatusState> emit,
  ) async {
    final result = await _loadStatusImages.call();

    result.fold(
      (Failure failure) => emit(
        const StatusLoadFailure(message: 'Something went wrong'),
      ),
      (List<Status> images) => emit(
        StatusImagesLoaded(images: images),
      ),
    );
  }

  void _onLoadStatusVideos(
    FetchStatusVideos event,
    Emitter<StatusState> emit,
  ) async {
    final result = await _loadStatusVideos.call();

    result.fold(
      (Failure failure) => emit(
        const StatusLoadFailure(message: 'Something went wrong'),
      ),
      (List<Status> videos) => emit(
        StatusVideosLoaded(videos: videos),
      ),
    );
  }

  void _onStoreStatus(
    StoreStatusVideos event,
    Emitter<StatusState> emit,
  ) {}

  void _onDestroyStatus(
    DestroyStatusVideos event,
    Emitter<StatusState> emit,
  ) {}
}
