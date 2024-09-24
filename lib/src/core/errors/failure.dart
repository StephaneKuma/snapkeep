// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String message;

  const Failure({
    this.message = 'An unexpected error occurred',
  });

  @override
  List<Object> get props => [message];
}

final class ServerFailure extends Failure {
  const ServerFailure({
    required super.message,
  });
}

final class CacheFailure extends Failure {
  const CacheFailure({
    required super.message,
  });
}

final class PermissionFailure extends Failure {
  const PermissionFailure({
    required super.message,
  });
}

final class LoadFailure extends Failure {
  const LoadFailure({
    required super.message,
  });
}
