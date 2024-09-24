part of 'status_bloc.dart';

sealed class StatusState extends Equatable {
  const StatusState();

  @override
  List<Object> get props => [];
}

final class StatusInitial extends StatusState {}

final class LoadingStatus extends StatusState {}

final class StatusImagesLoaded extends StatusState {
  final List<Status> images;

  const StatusImagesLoaded({required this.images});

  @override
  List<Object> get props => [images];
}

final class StatusVideosLoaded extends StatusState {
  final List<Status> videos;

  const StatusVideosLoaded({required this.videos});

  @override
  List<Object> get props => [videos];
}

final class StatusLoadFailure extends StatusState {
  final String message;

  const StatusLoadFailure({required this.message});

  @override
  List<Object> get props => [message];
}
