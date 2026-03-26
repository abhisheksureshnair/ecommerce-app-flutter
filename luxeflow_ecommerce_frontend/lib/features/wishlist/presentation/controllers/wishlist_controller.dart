import 'package:get/get.dart';
import 'package:luxeflow_ecommerce/features/product/data/models/product.dart';

class WishlistController extends GetxController {
  final RxList<Product> wishlistItems = <Product>[].obs;

  void toggleWishlist(Product product) {
    bool exists = wishlistItems.any((item) => item.id == product.id);
    if (exists) {
      wishlistItems.removeWhere((item) => item.id == product.id);
    } else {
      wishlistItems.add(product);
    }
  }

  bool isInWishlist(String productId) {
    return wishlistItems.any((item) => item.id == productId);
  }
}
