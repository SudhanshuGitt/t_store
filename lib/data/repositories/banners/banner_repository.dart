import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:t_store/data/services/firebase_storage_service.dart';
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
  /// Upload Categories to Cloud Firebase
  Future<void> uploadDummyData(List<BannerModel> banners) async {
    try {
      // Upload categories along with their images
      final storage = Get.put(TFirebaseStorageService());

      for (var banner in banners) {
        final file = await loadAssetAsXFile(banner.imageUrl);
        // Upload image and gets its URL
        final url = await storage.uploadImageFile('Banners', file!);

        // Assign URL to Category.image attribute
        banner.imageUrl = url;

        // Storage Category in Firestore
        await _db.collection("Banners").doc().set(banner.toJson());
      }
    } on FirebaseException catch (e) {
      throw TFormatException(e.code).message;
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  Future<XFile?> loadAssetAsXFile(String assetPath) async {
    try {
      final byteData = await rootBundle.load(assetPath);
      final tempFile = File(
        '${(await getTemporaryDirectory()).path}/${assetPath.split(Platform.pathSeparator).last}',
      );
      await tempFile.writeAsBytes(
        byteData.buffer.asUint8List(
          byteData.offsetInBytes,
          byteData.lengthInBytes,
        ),
      );
      return XFile(tempFile.path);
    } catch (e) {
      throw "Error loading asset: $e";
    }
  }
}
