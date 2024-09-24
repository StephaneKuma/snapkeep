import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:share_plus/share_plus.dart';
import 'package:snapkeep/src/core/constants/paths.dart';

import 'package:snapkeep/src/whatsapp/domain/entities/status.dart';

part 'status_state.dart';

@lazySingleton
class StatusCubit extends Cubit<StatusState> {
  StatusCubit() : super(StatusInitial());

  void store({required Status status}) async {
    try {
      final PermissionStatus permissionStatus =
          await Permission.storage.request();

      if (permissionStatus.isGranted) {
        final Directory directory = Directory(kAppFolderPath);

        if (!(await directory.exists())) {
          await directory.create(recursive: true);
        }

        final file = File(status.path);

        if (await file.exists()) {
          final String newFilePath =
              '${directory.path}/${file.uri.pathSegments.last}';

          await file.copy(newFilePath);

          emit(const StatusActionSuccess(success: true));
        } else {
          emit(
            const StatusActionFailure(message: 'Fichier source non trouvé.'),
          );
        }
      }

      emit(
        const StatusActionFailure(message: 'Permission d\'écriture refusée.'),
      );
    } catch (e) {
      emit(
        StatusActionFailure(message: e.toString()),
      );
    }
  }

  void share({required Status status}) async {
    try {
      final File file = File(status.path);

      if (await file.exists()) {
        await Share.shareXFiles([XFile(file.path)]);
      } else {
        emit(
          const StatusActionFailure(message: 'Fichier source non trouvé.'),
        );
      }
    } catch (e) {
      emit(
        StatusActionFailure(message: e.toString()),
      );
    }
  }

  void destroy({required String fileName}) async {
    try {
      final Directory externalDirectory = Directory(kAppFolderPath);
      final File fileToDelete = File('${externalDirectory.path}/$fileName');

      if (await fileToDelete.exists()) {
        await fileToDelete.delete();
        emit(const StatusActionSuccess(success: true));
      } else {
        emit(
          const StatusActionFailure(message: 'Fichier source non trouvé.'),
        );
      }
    } catch (e) {
      emit(
        StatusActionFailure(message: e.toString()),
      );
    }
  }
}
