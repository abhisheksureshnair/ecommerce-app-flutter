import 'package:get/get.dart';
import '../../domain/models/cart_item.dart';
import '../../../product/data/models/product.dart';

class CartController extends GetxController {
  final RxList<CartItem> cartItems = <CartItem>[].obs;

  void addToCart(Product product) {
    final index = cartItems.indexWhere((item) => item.product.id == product.id);
    if (index != -1) {
      cartItems[index].quantity++;
      cartItems.refresh();
    } else {
      cartItems.add(CartItem(product: product));
    }
  }

  void removeFromCart(String productId) {
    cartItems.removeWhere((item) => item.product.id == productId);
  }

  void incrementQuantity(String productId) {
    final index = cartItems.indexWhere((item) => item.product.id == productId);
    if (index != -1) {
      cartItems[index].quantity++;
      cartItems.refresh();
    }
  }

  void decrementQuantity(String productId) {
    final index = cartItems.indexWhere((item) => item.product.id == productId);
    if (index != -1 && cartItems[index].quantity > 1) {
      cartItems[index].quantity--;
      cartItems.refresh();
    } else if (index != -1 && cartItems[index].quantity == 1) {
      removeFromCart(productId);
    }
  }

  double get totalAmount {
    return cartItems.fold(0, (sum, item) => sum + (item.product.price * item.quantity));
  }

  void clearCart() {
    cartItems.clear();
  }
}
