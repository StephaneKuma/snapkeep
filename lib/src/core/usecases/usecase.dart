import 'package:snapkeep/src/core/types/index.dart';

abstract class UseCase<Type, Param> {
  FutureResult<Type> call({required Param param});
}
