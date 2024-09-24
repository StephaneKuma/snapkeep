part of 'status_bloc.dart';

sealed class StatusEvent extends Equatable {
  const StatusEvent();

  @override
  List<Object> get props => [];
}

final class FetchStatusImages extends StatusEvent {}

final class FetchStatusVideos extends StatusEvent {}

final class StoreStatusVideos extends StatusEvent {
  final String path;

  const StoreStatusVideos({required this.path});

  @override
  List<Object> get props => [path];
}

final class DestroyStatusVideos extends StatusEvent {
  final String path;

  const DestroyStatusVideos({required this.path});

  @override
  List<Object> get props => [path];
}
