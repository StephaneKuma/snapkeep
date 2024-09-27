part of 'status_bloc.dart';

sealed class StatusEvent extends Equatable {
  const StatusEvent();

  @override
  List<Object> get props => [];
}

final class FetchStatuses extends StatusEvent {
  final bool isVideo;

  const FetchStatuses({required this.isVideo});

  @override
  List<Object> get props => [isVideo];
}

final class StoreStatusVideos extends StatusEvent {
  final String path;

  const StoreStatusVideos({required this.path});

  @override
  List<Object> get props => [path];
}

final class FetchStoredStatuses extends StatusEvent {}

final class DestroyStatusVideos extends StatusEvent {
  final String path;

  const DestroyStatusVideos({required this.path});

  @override
  List<Object> get props => [path];
}
