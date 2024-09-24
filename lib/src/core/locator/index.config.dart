// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:snapkeep/src/whatsapp/data/repositories/status_repository_implementation.dart'
    as _i747;
import 'package:snapkeep/src/whatsapp/domain/repositories/status_repository.dart'
    as _i206;
import 'package:snapkeep/src/whatsapp/domain/usecases/destroy_status.dart'
    as _i1045;
import 'package:snapkeep/src/whatsapp/domain/usecases/load_status_images.dart'
    as _i928;
import 'package:snapkeep/src/whatsapp/domain/usecases/load_status_videos.dart'
    as _i955;
import 'package:snapkeep/src/whatsapp/domain/usecases/store_status.dart'
    as _i516;
import 'package:snapkeep/src/whatsapp/presentation/bloc/status_bloc.dart'
    as _i194;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.lazySingleton<_i206.StatusRepository>(
        () => _i747.StatusRepositoryImplementation());
    gh.lazySingleton<_i1045.DestroyStatus>(
        () => _i1045.DestroyStatus(repository: gh<_i206.StatusRepository>()));
    gh.lazySingleton<_i928.LoadStatusImages>(
        () => _i928.LoadStatusImages(repository: gh<_i206.StatusRepository>()));
    gh.lazySingleton<_i955.LoadStatusVideos>(
        () => _i955.LoadStatusVideos(repository: gh<_i206.StatusRepository>()));
    gh.lazySingleton<_i516.StoreStatus>(
        () => _i516.StoreStatus(repository: gh<_i206.StatusRepository>()));
    gh.lazySingleton<_i194.StatusBloc>(() => _i194.StatusBloc(
          loadStatusImages: gh<_i928.LoadStatusImages>(),
          loadStatusVideos: gh<_i955.LoadStatusVideos>(),
          storeStatus: gh<_i516.StoreStatus>(),
          destroyStatus: gh<_i1045.DestroyStatus>(),
        ));
    return this;
  }
}
