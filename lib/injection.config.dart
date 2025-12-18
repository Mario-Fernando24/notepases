// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:notepases/src/di/AppModule.dart' as _i82;
import 'package:notepases/src/domain/repository/GeolocatorRepository.dart'
    as _i340;
import 'package:notepases/src/domain/useCases/geolocator/GeolocatorUseCase.dart'
    as _i364;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final appModule = _$AppModule();
    gh.factory<_i340.GeolocatorRepository>(
      () => appModule.geolocatorRepository,
    );
    gh.factory<_i364.GeolocatorUseCase>(() => appModule.geolocatorUseCase);
    return this;
  }
}

class _$AppModule extends _i82.AppModule {}
