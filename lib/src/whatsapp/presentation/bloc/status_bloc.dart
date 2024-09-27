import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import 'package:snapkeep/src/core/constants/paths.dart';
import 'package:snapkeep/src/core/errors/failure.dart';
import 'package:snapkeep/src/whatsapp/domain/entities/status.dart';
import 'package:snapkeep/src/whatsapp/domain/usecases/load_statuses.dart';

part 'status_event.dart';
part 'status_state.dart';

@lazySingleton
final class StatusBloc extends Bloc<StatusEvent, StatusState> {
  final LoadStatuses _loadStatuses;

  StatusBloc({
    required LoadStatuses loadStatuses,
  })  : _loadStatuses = loadStatuses,
        super(StatusInitial()) {
    on<StatusEvent>((_, emit) => emit(LoadingStatus()));

    on<FetchStatuses>(_onLoadStatuses);
    on<FetchStoredStatuses>(_onLoadStoredStatuses);
  }

  void _onLoadStatuses(
    FetchStatuses event,
    Emitter<StatusState> emit,
  ) async {
    final result = await _loadStatuses.call(
      param: LoadStatusParam(
        path: kWhatsAppPath,
        isVideo: event.isVideo,
      ),
    );

    result.fold(
      (Failure failure) => emit(
        StatusLoadFailure(message: failure.message),
      ),
      (List<Status> statuses) => emit(
        StatusLoaded(statuses: statuses),
      ),
    );
  }

  FutureOr<void> _onLoadStoredStatuses(
    FetchStoredStatuses event,
    Emitter<StatusState> emit,
  ) async {
    final result = await _loadStatuses.call(
      param: LoadStatusParam(
        path: kStoredWhatsAppPath,
        stored: true,
      ),
    );

    result.fold(
      (Failure failure) => emit(
        StatusLoadFailure(message: failure.message),
      ),
      (List<Status> statuses) => emit(
        StatusLoaded(statuses: statuses),
      ),
    );
  }
}
