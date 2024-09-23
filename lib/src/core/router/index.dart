import 'package:auto_route/auto_route.dart';
import 'package:snapkeep/src/whatsapp/presentation/pages/index.dart';

part 'index.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends RootStackRouter {
  @override
  RouteType get defaultRouteType => const RouteType.adaptive();

  @override
  List<AutoRoute> get routes => <AutoRoute>[
        AutoRoute(
          page: StatusRoute.page,
          initial: true,
        ),
      ];
}
