import 'package:get/get.dart';
import '../../../product/data/models/product.dart';
import '../../../product/data/repositories/product_repository.dart';

class AppSearchController extends GetxController {
  final ProductRepository _productRepo = ProductRepository();

  final RxList<Product> products = <Product>[].obs;
  final RxString searchQuery = ''.obs;
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
    } finally {
      isLoading.value = false;
    }
  }

  void updateSearchQuery(String query) {
    searchQuery.value = query;
  }

  List<Product> get filteredProducts {
    if (searchQuery.value.isEmpty) {
      return products;
    }
    return products.where((p) =>
      p.name.toLowerCase().contains(searchQuery.value.toLowerCase()) ||
      p.category.toLowerCase().contains(searchQuery.value.toLowerCase())
    ).toList();
  }
}
