import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:t_store/features/shop/models/banner_model.dart';
import 'package:t_store/utils/exceptions/format_exceptions.dart';
import 'package:t_store/utils/exceptions/platform_exceptions.dart';

class BannerRepository extends RxController {
  static BannerRepository get instance => Get.find();

  /// Variables
  final _db = FirebaseFirestore.instance;

  /// Get all order related to current user
  Future<List<BannerModel>> fetchBanners() async {
    try {
      // get all the data from the collection
      final snapshot = await _db
          .collection('Banners')
          .where('Active', isEqualTo: true)
          .get();
      final list = snapshot.docs
          .map((doc) => BannerModel.fromSnapshot(doc))
          .toList();
      return list;
    } on FirebaseException catch (e) {
      throw TFormatException(e.code).message;
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong while fetching Banners.';
    }
  }

  // Upload Banners to Cloud Firebase
}
