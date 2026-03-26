import 'package:get/get.dart';
import '../../../product/data/models/product.dart';
import '../../../product/data/repositories/product_repository.dart';

class HomeController extends GetxController {
  final ProductRepository _productRepo = ProductRepository();

  final RxList<Product> products = <Product>[].obs;
  final RxString selectedCategory = 'All'.obs;
  final RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchProducts();
  }

  Future<void> fetchProducts() async {
    isLoading.value = true;
    try {
      final fetchedProducts = await _productRepo.getProducts();
      products.assignAll(fetchedProducts);
    } catch (e) {
      Get.snackbar('Error', 'Failed to load products');
    } finally {
      isLoading.value = false;
    }
  }

  void selectCategory(String category) {
    selectedCategory.value = category;
  }

  List<Product> get filteredProducts {
    if (selectedCategory.value == 'All') {
      return products;
    }
    return products.where((p) => p.category == selectedCategory.value).toList();
  }
}
