import 'package:get/get.dart';
import 'package:t_store/data/repositories/categories/category_repository.dart';
import 'package:t_store/features/shop/models/category_model.dart';
import 'package:t_store/utils/popups/loaders.dart';

class CategoryController extends RxController {
  static CategoryController get instance => Get.find();

  final isLoading = false.obs;
  final _categoryRepository = Get.put(CategoryRepository());
  RxList<CategoryModel> allCategories = <CategoryModel>[].obs;
  RxList<CategoryModel> featuredCategories = <CategoryModel>[].obs;

  @override
  void onInit() {
    // get all categories only one time when this instance is created
    fetchCategories();
    //loadCategories();
    super.onInit();
  }

  // void loadCategories() async {
  //   await _categoryRepository.uploadDummyData(TDummyData.categories);
  // }

  /// Load Category data
  // we want to fetch category just once as it will prevent round trips reduce the no of reads
  Future<void> fetchCategories() async {
    try {
      // show loader while loading categories
      isLoading.value = true;

      // fetch categories from datasource(firestore, API etc)
      final categories = await _categoryRepository.getAllCategories();

      // update the category list
      allCategories.assignAll(categories);

      // filter featured categories
      featuredCategories.assignAll(
        allCategories
            .where(
              // all the category which are parent category
              (category) => category.isFeatured && category.parentId.isEmpty,
            )
            .take(8)
            .toList(),
      );
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    } finally {
      // Remove loader
      isLoading.value = false;
    }
  }

  /// Load Selected Category Data
  ///
  /// Get Category or Sub-Category Products
}
