import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:t_store/features/authentication/screens/login/login.dart';
import 'package:t_store/features/authentication/screens/onboarding/onboarding.dart';
import 'package:t_store/utils/exceptions/firebase_auth_exceptions.dart';
import 'package:t_store/utils/exceptions/format_exceptions.dart';
import 'package:t_store/utils/exceptions/platform_exceptions.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  /// Variables
  final deviceStorage = GetStorage();
  final _auth = FirebaseAuth.instance;

  /// called from main.dart on app launch
  /// orReady will be triggered when this repo is called first time
  @override
  void onReady() {
    // we will load the userState
    FlutterNativeSplash.remove();
    screenRedirect();
  }

  /// Function to show relevant screen
  screenRedirect() async {
    // here we will se if user is logged in or not
    /// Local Storage
    /// fetch local storage variable
    // if IsFirstTime is null then it will write the value in local storage
    deviceStorage.writeIfNull('IsFirstTime', true);
    // if it is not first time of the user it will redirect
    deviceStorage.read('IsFirstTime') != true
        ? Get.offAll(() => const LoginScreen())
        : Get.offAll(const OnBoardingScreen());
  }

  /*-------------------------------  Email & Password Signin ----------------------- */

  /// [EmailAuthentication] - Signin

  /// [EmailAuthentication] - Register
  Future<UserCredential> registerWithEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      return await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FormatException catch (_) {
      throw TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again1';
    }
  }

  /// [ReAuthenticate] - ReAuthenticate User

  /// [Email Verification] - MAIL VERIFICATION

  /// [FORGET PASSWORD] - FORGET PASSWORD

  /*------------------------------- Federated identity & social sign in ----------------------- */

  /// [GoogleAuthentication] - GOOGLE

  /// [FacebookAuthentication] - FACEBOOK

  /*------------------------------- Federated identity & social sign in ----------------------- */

  /// [LogoutUser]- valid for any authentication

  /// [DELETE USER] - Remove user Auth and Firestore Account.
}
