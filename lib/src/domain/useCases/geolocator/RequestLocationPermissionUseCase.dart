import 'package:notepases/src/domain/repository/GeolocatorRepository.dart';

class RequestLocationPermissionUseCase {

   GeolocatorRepository geolocatorRepository;

   RequestLocationPermissionUseCase(this.geolocatorRepository);

    run()=> geolocatorRepository.requestLocationPermission();

}