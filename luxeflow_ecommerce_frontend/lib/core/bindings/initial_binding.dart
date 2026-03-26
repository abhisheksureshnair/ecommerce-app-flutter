import 'package:get/get.dart';
import '../../features/cart/presentation/controllers/cart_controller.dart';
import '../../features/home/presentation/controllers/home_controller.dart';
import '../../features/home/presentation/controllers/main_controller.dart';
import '../../features/search/presentation/controllers/app_search_controller.dart';
import '../../features/profile/presentation/controllers/profile_controller.dart';
import '../../features/auth/presentation/controllers/auth_controller.dart';
import '../../features/wishlist/presentation/controllers/wishlist_controller.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(AuthController(), permanent: true);
    Get.put(MainController(), permanent: true);
    Get.put(HomeController(), permanent: true);
    Get.put(CartController(), permanent: true);
    Get.put(AppSearchController(), permanent: true);
    Get.put(ProfileController(), permanent: true);
    Get.put(WishlistController(), permanent: true);
  }
}
