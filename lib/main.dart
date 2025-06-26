import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/app.dart';
import 'package:t_store/firebase_options.dart';

/// Entry point of our application
Future<void> main() async {
  // Todo: Add Widgets Binding
  // Todo: Init Local Storage
  // Todo: Init Payment Methods
  // Todo: Await Native Splash
  // Todo: Initialize firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  ).then(
    // whenever the firebase initialization is ready we are going to check our own firebase authentication
    // it user is logged in or logout so we redirect the user to some other screen
    (FirebaseApp value) => Get.put(AuthenticationRepository()),
  );

  // Todo : Initialize Authentication

  runApp(const App());
}
