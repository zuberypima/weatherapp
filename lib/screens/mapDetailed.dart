import 'package:flutter/material.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';

class Mapdetailed extends StatefulWidget {
  double latitud;
  double longitude;
  Mapdetailed({super.key, required this.latitud, required this.longitude});

  @override
  State<Mapdetailed> createState() => _MapdetailedState();
}

class _MapdetailedState extends State<Mapdetailed> {
  double lati = 47.4358055;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          // title: Text('Map Example'),
          ),
      body: OSMFlutter(
        controller: MapController(
          initPosition:
              GeoPoint(latitude: widget.latitud, longitude: widget.longitude),
          // areaLimit: BoundingBox(
          //   east: 10.4922941,
          //   north: 47.8084648,
          //   south: 45.817995,
          //   west: 5.9559113,
          // ),
        ),

        osmOption: OSMOption(
          enableRotationByGesture: true,
          userTrackingOption: UserTrackingOption(enableTracking: true),
          zoomOption: ZoomOption(
            initZoom: 10.0,
          ),
        ),
        mapIsLoading: Center(child: CircularProgressIndicator()),
        onGeoPointClicked: (p0) {},
        //  initialPosition: GeoPoint(latitude: 37.7749, longitude: -122.4194),
      ),
    );
  }
}

class MappContoler {
  // default constructor
  MapController controller = MapController(
    initPosition: GeoPoint(latitude: 47.4358055, longitude: 8.4737324),
    areaLimit: BoundingBox(
      east: 10.4922941,
      north: 47.8084648,
      south: 45.817995,
      west: 5.9559113,
    ),
  );
// or set manually init position
  MapController controllerPosition = MapController.withPosition(
    initPosition: GeoPoint(
      latitude: 47.4358055,
      longitude: 8.4737324,
    ),
  );
// init the position using the user location
  final controllerUSerTrackin = MapController.withUserPosition(
      trackUserLocation: UserTrackingOption(
    enableTracking: true,
    unFollowUser: false,
  ));

// init the position using the user location and control map from outside
  final controllerEnable = MapController.withUserPosition(
      trackUserLocation: UserTrackingOption(
        enableTracking: true,
        unFollowUser: false,
      ),
      useExternalTracking: true);
}
