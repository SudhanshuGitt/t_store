import 'package:cloud_firestore/cloud_firestore.dart';

class BannerModel {
  BannerModel({
    required this.imageUrl,
    required this.targetScreen,
    required this.active,
  });

  final String imageUrl;
  final String targetScreen;
  final bool active;

  // /// Empty Helper Functions
  // static BannerModel empty() =>
  //     BannerModel(id: '', name: '', image: '', isFeatured: false);

  /// Convert model to Json structure so that we can store data in Firebase
  // in dart json is Map
  Map<String, dynamic> toJson() {
    return {
      'ImageUrl': imageUrl,
      'TargetScreen': targetScreen,
      'Active': active,
    };
  }

  /// Map Json oriented document snapshot from firebase to BannerModel
  // to create named constructor in class we use factory method
  factory BannerModel.fromSnapshot(
    DocumentSnapshot<Map<String, dynamic>> document,
  ) {
    final data = document.data()!;

    // Map JSON Record to the model
    return BannerModel(
      imageUrl: data['ImageUrl'] ?? '',
      targetScreen: data['TargetScreen'] ?? '',
      active: data['Active'] ?? false,
    );
  }
}
