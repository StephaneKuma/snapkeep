import 'package:dartz/dartz.dart';
import 'package:snapkeep/src/core/errors/failure.dart';

typedef FutureResult<T> = Future<Either<Failure, T>>;
typedef FutureVoid = FutureResult<void>;
