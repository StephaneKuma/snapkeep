import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:snapkeep/src/core/constants/extensions.dart';
import 'package:snapkeep/src/core/constants/whatsapp.dart';
import 'package:snapkeep/src/core/errors/failure.dart';
import 'package:snapkeep/src/core/types/index.dart';
import 'package:snapkeep/src/whatsapp/data/models/status_model.dart';
import 'package:snapkeep/src/whatsapp/domain/repositories/status_repository.dart';

@LazySingleton(as: StatusRepository)
final class StatusRepositoryImplementation implements StatusRepository {
  Future<bool> _checkPermission() async {
    final status = await Permission.storage.request();

    return status.isGranted;
  }

  @override
  FutureResult<bool> destroy({required String path}) {
    throw UnimplementedError();
  }

  @override
  FutureResult<List<StatusModel>> images() async {
    if (await _checkPermission()) {
      final whatsappStatuses = await loadStatuses(
        path: kWhatsAppPath,
        extensions: kSupportedImagesExtensions,
        isVideo: false,
      );

      return Right(whatsappStatuses);
    } else {
      return const Left(PermissionFailure(message: 'Permission Denied'));
    }
  }

  @override
  FutureResult<bool> store({required String path}) {
    throw UnimplementedError();
  }

  @override
  FutureResult<List<StatusModel>> videos() {
    throw UnimplementedError();
  }

  Future<List<StatusModel>> loadStatuses({
    required String path,
    required List<String> extensions,
    required bool isVideo,
  }) async {
    final directory = Directory(path);

    if (await directory.exists()) {
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
