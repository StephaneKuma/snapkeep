part of 'status_bloc.dart';

sealed class StatusState extends Equatable {
  const StatusState();

  @override
  List<Object> get props => [];
}

final class StatusInitial extends StatusState {}

final class LoadingStatus extends StatusState {}

final class StatusLoaded extends StatusState {
  final List<Status> statuses;

  const StatusLoaded({required this.statuses});

  @override
  List<Object> get props => [statuses];
}

final class StatusLoadFailure extends StatusState {
  final String message;

  const StatusLoadFailure({required this.message});

  @override
  List<Object> get props => [message];
}
final class StatusStored extends StatusState {
  final bool success;

  const StatusStored({required this.success});

  @override
  List<Object> get props => [success];
}
