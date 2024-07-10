// import 'package:geolocator/geolocator.dart';

// Future<Position> getLocation() async {
//   bool serviceEnabled;
//   LocationPermission permission;

//   permission = await Geolocator.checkPermission();
//   if (permission == LocationPermission.denied) {
//     permission = await Geolocator.requestPermission();
//     if (permission == LocationPermission.denied) {
//       return Future.error('Location permissions are denied');
//     }
//   }

//   if (permission == LocationPermission.deniedForever) {
//     // Permissions are denied forever, handle appropriately.
//     return Future.error(
//       'Location permissions are permanently denied, we cannot request permissions.',
//     );
//   }

//   return await Geolocator.getCurrentPosition();
// }
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';

Future<Position> getLocation() async {
  PermissionStatus status = await Permission.location.status;

  if (status.isDenied) {
    status = await Permission.location.request();
    if (status.isDenied) {
      return Future.error('Location permissions are denied');
    }
  }

  if (status.isPermanentlyDenied) {
    return Future.error(
      'Location permissions are permanently denied, we cannot request permissions.',
    );
  }

  return await Geolocator.getCurrentPosition();
}
