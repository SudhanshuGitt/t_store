import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:t_store/app.dart';
import 'package:t_store/data/repositories/authentication/authentication_repository.dart';
import 'package:t_store/firebase_options.dart';

/// Entry point of our application
Future<void> main() async {
  //  Add Widgets Binding
  // whenever we are going to initialize we make sure before oue app run our initialization is completed
  final WidgetsBinding widgetsBinding =
      WidgetsFlutterBinding.ensureInitialized();
  //  Getx Local Storage
  // initialize the getx storage
  await GetStorage.init();
  // Todo: Init Payment Methods

  // Await Native Splash
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  // Todo: Initialize firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  ).then(
    // whenever the firebase initialization is ready we are going to check our own firebase authentication
    // it user is logged in or logout so we redirect the user to some other screen
    // we use this AuthenticationRepository we will redirect user to login screen if successful
    (FirebaseApp value) => Get.put(AuthenticationRepository()),
  );

  // Todo : Initialize Authentication

  runApp(const App());
}
