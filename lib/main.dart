import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
      home: SplashScreen(), // Show SplashScreen first
    );
  }
}
