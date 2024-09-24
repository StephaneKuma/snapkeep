// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'index.dart';

/// generated route for
/// [ImageViewerPage]
class ImageViewerRoute extends PageRouteInfo<ImageViewerRouteArgs> {
  ImageViewerRoute({
    Key? key,
    required Status status,
    List<PageRouteInfo>? children,
  }) : super(
          ImageViewerRoute.name,
          args: ImageViewerRouteArgs(
            key: key,
            status: status,
          ),
          initialChildren: children,
        );

  static const String name = 'ImageViewerRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ImageViewerRouteArgs>();
      return ImageViewerPage(
        key: args.key,
        status: args.status,
      );
    },
  );
}

class ImageViewerRouteArgs {
  const ImageViewerRouteArgs({
    this.key,
    required this.status,
  });

  final Key? key;

  final Status status;

  @override
  String toString() {
    return 'ImageViewerRouteArgs{key: $key, status: $status}';
  }
}

/// generated route for
/// [ImagesPage]
class ImagesRoute extends PageRouteInfo<void> {
  const ImagesRoute({List<PageRouteInfo>? children})
      : super(
          ImagesRoute.name,
          initialChildren: children,
        );

  static const String name = 'ImagesRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const ImagesPage();
    },
  );
}

/// generated route for
/// [SavedPage]
class SavedRoute extends PageRouteInfo<void> {
  const SavedRoute({List<PageRouteInfo>? children})
      : super(
          SavedRoute.name,
          initialChildren: children,
        );

  static const String name = 'SavedRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const SavedPage();
    },
  );
}

/// generated route for
/// [StatusPage]
class StatusRoute extends PageRouteInfo<void> {
  const StatusRoute({List<PageRouteInfo>? children})
      : super(
          StatusRoute.name,
          initialChildren: children,
        );

  static const String name = 'StatusRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const StatusPage();
    },
  );
}

/// generated route for
/// [VideosPage]
class VideosRoute extends PageRouteInfo<void> {
  const VideosRoute({List<PageRouteInfo>? children})
      : super(
          VideosRoute.name,
          initialChildren: children,
        );

  static const String name = 'VideosRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const VideosPage();
    },
  );
}
