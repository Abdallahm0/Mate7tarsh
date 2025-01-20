// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:get/get.dart';
// import 'package:flutter/material.dart';
// import 'package:mate7tarsh/Screens/landing_page.dart';
// import 'package:mate7tarsh/Screens/complete_your_profile.dart';

// class AuthController extends GetxController {
//   // Observables for form inputs
//   var email = ''.obs;
//   var password = ''.obs;
//   var confirmPassword = ''.obs;
//   var isLoading = false.obs;

//   // Function to handle sign-up
//   Future<void> signUpUser() async {
//     if (password.value != confirmPassword.value) {
//       Get.snackbar('Error', 'Passwords do not match',
//           snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.red);
//       return;
//     }

//     if (email.value.isEmpty || password.value.isEmpty) {
//       Get.snackbar('Error', 'Email and password cannot be empty',
//           snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.red);
//       return;
//     }

//     try {
//       isLoading.value = true;
//       // TODO: Call backend signup API. When the server gives back the
//       // authentication token, we need to store it somehow in local storage
//       // The storing part can be skipped for the demo

//       Get.snackbar('Success', 'Account created successfully!',
//           snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.green);

//       // Navigate to the CompleteProfilePage
//       Get.offAll(() => CompleteProfilePage());
//     } on FirebaseAuthException catch (e) {
//       String errorMessage = e.message ?? 'Unknown error occurred';
//       Get.snackbar('Error', errorMessage,
//           snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.red);
//     } finally {
//       isLoading.value = false;
//     }
//   }

//   // Function to handle sign-in
//   Future<void> signInUser() async {
//     if (email.value.isEmpty || password.value.isEmpty) {
//       Get.snackbar('Error', 'Email and password cannot be empty',
//           snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.red);
//       return;
//     }

//     try {
//       isLoading.value = true;
//       UserCredential userCredential = await _auth.signInWithEmailAndPassword(
//         email: email.value,
//         password: password.value,
//       );

//       Get.snackbar('Success', 'Logged in successfully!',
//           snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.green);

//       // Navigate to the landing page
//       Get.offAll(() => LandingPage());
//     } on FirebaseAuthException catch (e) {
//       String errorMessage = e.message ?? 'Unknown error occurred';
//       Get.snackbar('Error', errorMessage,
//           snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.red);
//     } finally {
//       isLoading.value = false;
//     }
//   }
// }
