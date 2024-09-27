import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:permission_handler/permission_handler.dart';

import 'package:snapkeep/src/core/constants/extensions.dart';
import 'package:snapkeep/src/core/errors/failure.dart';
import 'package:snapkeep/src/core/types/index.dart';
import 'package:snapkeep/src/whatsapp/data/models/status_model.dart';
import 'package:snapkeep/src/whatsapp/domain/repositories/status_repository.dart';

@LazySingleton(as: StatusRepository)
final class StatusRepositoryImplementation implements StatusRepository {
  Future<bool> _checkPermission() async {
    final storagePermission = await Permission.storage.request();
    final externalStoragePermission =
        await Permission.manageExternalStorage.request();

    return storagePermission.isGranted && externalStoragePermission.isGranted;
  }

  @override
  FutureResult<List<StatusModel>> statuses({
    required String path,
    bool stored = false,
    bool isVideo = false,
  }) async {
    if (await _checkPermission()) {
      final whatsappStatuses = await loadStatuses(
        path: path,
        isVideo: isVideo,
      );

      return Right(whatsappStatuses);
    } else {
      return const Left(PermissionFailure(message: 'Permission Denied'));
    }
  }

  @override
  FutureResult<List<StatusModel>> storedStatuses({
    required String path,
  }) async {
    if (await _checkPermission()) {
      final directory = Directory(path);

      if (await directory.exists()) {
        final supportedExtensions =
            kSupportedImagesExtensions + kSupportedVideoExtensions;

        final files = directory.listSync().where((FileSystemEntity file) {
          return supportedExtensions
              .any((extension) => file.path.endsWith(extension));
        }).map((file) {
          final isVideo =
              kSupportedVideoExtensions.any((ext) => file.path.endsWith(ext));

          return StatusModel(
            path: file.path,
            isVideo: isVideo,
          );
        }).toList();

        return Right(files);
      } else {
        return const Right([]);
      }
    } else {
      return const Left(PermissionFailure(message: 'Permission Denied'));
    }
  }

  Future<List<StatusModel>> loadStatuses({
    required String path,
    bool stored = false,
    required bool isVideo,
  }) async {
    final directory = Directory(path);

    if (await directory.exists()) {
      final extensions =
          isVideo ? kSupportedVideoExtensions : kSupportedImagesExtensions;

      final files = directory.listSync().where((FileSystemEntity file) {
        return extensions.any((extension) => file.path.endsWith(extension));
      }).map((file) {
        return StatusModel(
          path: file.path,
          isVideo: isVideo,
        );
      }).toList();
      return files;
    } else {
      return [];
    }
  }
}
