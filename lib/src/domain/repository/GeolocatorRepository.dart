
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:notepases/src/domain/models/DTO/locationPermissionResult.dart';
import 'package:notepases/src/domain/models/PlaceMarkData.dart';

abstract class GeolocatorRepository {


  Future<LocationPermissionResult> requestLocationPermission();

  Future<Position> findPosition();
  Future<BitmapDescriptor> createMarkerFromAsset(String path);
  Marker getMarker(
    String markeId,
    double lat,
    double lng,
    String title,
    String content,
    BitmapDescriptor imageMarke
  );

  // 
  Future<PlacemarkData?> getPlaceData(CameraPosition position);

  Future<List<LatLng>> getPolylineCoordinates(
    LatLng lugarRecogidad,
    LatLng lugarDestino
  );

  // para obtener actualizaciones continuas de la posición del dispositivo
  Stream<Position> getPositionStream();

}