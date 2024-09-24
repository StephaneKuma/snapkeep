import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:snapkeep/src/core/router/index.dart';
import 'package:snapkeep/src/core/widgets/tab_item.dart';

@RoutePage()
class StatusPage extends StatelessWidget {
  const StatusPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter.tabBar(
      routes: const <PageRouteInfo>[
        ImagesRoute(),
        VideosRoute(),
        SavedRoute(),
      ],
      builder: (context, child, controller) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Snap Keep'),
            bottom: TabBar(
              controller: controller,
              tabs: const <Tab>[
                Tab(
                  child: TabItem(
                    icon: FontAwesomeIcons.images,
                    text: 'Images',
                  ),
                ),
                Tab(
                  child: TabItem(
                    icon: FontAwesomeIcons.photoFilm,
                    text: 'Videos',
                  ),
                ),
                Tab(
                  child: TabItem(
                    icon: FontAwesomeIcons.download,
                    text: 'Saved',
                  ),
                ),
              ],
            ),
          ),
          body: child,
        );
      },
    );
  }
}
