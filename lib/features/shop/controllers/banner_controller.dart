import 'package:get/get.dart';
import 'package:t_store/data/repositories/banners/banner_repository.dart';
import 'package:t_store/features/shop/models/banner_model.dart';
import 'package:t_store/utils/dummydata/TDummyData.dart';
import 'package:t_store/utils/popups/loaders.dart';

class BannerController extends RxController {
  static BannerController get instance => Get.find();

  /// Variables
  final carousalCurrentIndex = 0.obs;
  final isLoading = false.obs;
  final _bannerRepository = Get.put(BannerRepository());
  RxList<BannerModel> banners = <BannerModel>[].obs;

  @override
  void onInit() {
    fetchBanners();
    //loadBanners();
    super.onInit();
  }

  // void loadBanners() async {
  //   await _bannerRepository.uploadDummyData(TDummyData.banners);
  // }

  // Update Page Navigation dots
  void updatePageIndicator(index) {
    carousalCurrentIndex.value = index;
  }

  /// Fetch Banners
  Future<void> fetchBanners() async {
    try {
      // show loader while loading categories
      isLoading.value = true;

      // fetch banners from datasource(firestore, API etc)
      final banners = await _bannerRepository.fetchBanners();

      // assign bannersS
      this.banners.assignAll(banners);
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    } finally {
      // Remove loader
      isLoading.value = false;
    }
  }
}
