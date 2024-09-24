import 'package:snapkeep/src/core/types/index.dart';

abstract class UseCase<Type, Params> {
  FutureResult<Type> call({required Params params});
}
