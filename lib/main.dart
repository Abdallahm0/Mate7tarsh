import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:geolocator/geolocator.dart'; // Add geolocator package
import 'package:mate7tarsh/Screens/login_screen.dart';
import 'splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Ensure Firebase is initialized before making any calls
  await Firebase.initializeApp();

  // Only configure emulator when in debug mode and using emulator
  if (kDebugMode) {
    FirebaseAuth.instance.useAuthEmulator('10.0.2.2', 9099);
  }

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My App',
      home: LoginScreen(), // Show SplashScreen first
    );
  }
}

// LocationService Class
class LocationService {
  // Request Location Permissions
  Future<void> requestLocationPermission() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        throw "Location permission denied";
      }
    }
    if (permission == LocationPermission.deniedForever) {
      throw "Location permission permanently denied";
    }
  }

  // Get Current Location
  Future<Position> getCurrentLocation() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      throw "Location services are disabled";
    }

    return await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
  }
}

// Example Usage in a Screen
class LocationScreen extends StatefulWidget {
  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  String locationText = "Press the button to get location";
  final LocationService _locationService = LocationService();

  Future<void> fetchLocation() async {
    try {
      await _locationService.requestLocationPermission();
      Position position = await _locationService.getCurrentLocation();
      setState(() {
        locationText = "Latitude: ${position.latitude}, Longitude: ${position.longitude}";
      });
    } catch (e) {
      setState(() {
        locationText = "Error: $e";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Location Service"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(locationText),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: fetchLocation,
              child: Text("Get Location"),
            ),
          ],
        ),
      ),
    );
  }
}