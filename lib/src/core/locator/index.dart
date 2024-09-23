import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'index.config.dart';

GetIt locator = GetIt.I;

@InjectableInit()
void configureDependencies() => locator.init();
