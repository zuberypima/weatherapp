class FamousCity {
  final String name;
  final double lat;
  final double lon;

  const FamousCity({
    required this.name,
    required this.lat,
    required this.lon,
  });
}

// List of famous cities as a constant
List<FamousCity> famousCities = const [
  FamousCity(name: 'Mbeya', lat: 8.909401, lon: 33.460773),
  FamousCity(name: 'Dar es salaam', lat: 6.776012, lon: 39.178326),
  FamousCity(name: 'Morogoro', lat: 6.830373, lon: 37.670589),
  FamousCity(name: 'Dodoma', lat: 6.161184, lon: 35.745426),
  FamousCity(name: 'Arusha', lat: 3.386925, lon: 36.682995),
  FamousCity(name: 'Mwanza', lat: 2.5167, lon: 32.9),
];
