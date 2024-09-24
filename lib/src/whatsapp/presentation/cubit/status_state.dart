part of 'status_cubit.dart';

sealed class StatusState extends Equatable {
  const StatusState();

  @override
  List<Object> get props => [];
}

final class StatusInitial extends StatusState {}

final class StatusActionSuccess extends StatusState {
  final bool success;

  const StatusActionSuccess({required this.success});

  @override
  List<Object> get props => [success];
}

final class StatusActionFailure extends StatusState {
  final String message;

  const StatusActionFailure({required this.message});

  @override
  List<Object> get props => [message];
}
