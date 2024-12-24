import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:geolocator/geolocator.dart';

/// Fetches the current location of the user.
Future<Position> getCurrentLocation() async {
  bool serviceEnabled;
  LocationPermission permission;

  // Check if location services are enabled
  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    throw Exception('Location services are disabled. Please enable them.');
  }

  // Check and request location permissions
  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.deniedForever) {
    throw Exception(
        'Location permissions are permanently denied. Grant access from settings.');
  } else if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      throw Exception('Location permissions are denied.');
    }
  }

  // Return the user's current position
  return await Geolocator.getCurrentPosition(
    desiredAccuracy: LocationAccuracy.high,
  );
}






/// Fetches the address from the given latitude and longitude using the Google Maps API.
Future<String> getAddressFromLatLng(Position position) async {
  const String apiKey = 'AIzaSyBsQ4V5vV49yYx6oXbYXkfy8kh8kPDnix4';
  final String url =
      'https://maps.googleapis.com/maps/api/geocode/json?latlng=${position.latitude},${position.longitude}&key=$apiKey';

  try {
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);

      // Check if results exist
      if (data['results'] != null && data['results'].isNotEmpty) {
        return data['results'][0]['formatted_address'];
      } else {
        throw Exception('No address found for the provided coordinates.');
      }
    } else {
      throw Exception(
          'Failed to fetch address. Status code: ${response.statusCode}');
    }
  } catch (e) {
    throw Exception('An error occurred while fetching the address: $e');
  }
}
