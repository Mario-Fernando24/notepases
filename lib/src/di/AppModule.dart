import 'package:injectable/injectable.dart';
import 'package:notepases/src/data/repository/GeolocartorRepositoryImpl.dart';
import 'package:notepases/src/domain/repository/GeolocatorRepository.dart';
import 'package:notepases/src/domain/useCases/geolocator/GeolocatorUseCase.dart';
import 'package:notepases/src/domain/useCases/geolocator/RequestLocationPermissionUseCase.dart';

@module
abstract class AppModule {

  @injectable
  GeolocatorRepository get geolocatorRepository => Geolocartorrepositoryimpl();

  @injectable
  GeolocatorUseCase get geolocatorUseCase => GeolocatorUseCase(
    requestLocationPermissionUseCase: RequestLocationPermissionUseCase(geolocatorRepository)
  );  

}