import 'package:get/get.dart';
import '../controllers/home_controller.dart';
import '../controllers/main_controller.dart';
import '../../../search/presentation/controllers/app_search_controller.dart';
import '../../../cart/presentation/controllers/cart_controller.dart';
import '../../../profile/presentation/controllers/profile_controller.dart';
import '../../../auth/presentation/controllers/auth_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MainController>(() => MainController());
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<AppSearchController>(() => AppSearchController());
    Get.lazyPut<CartController>(() => CartController());
    Get.lazyPut<ProfileController>(() => ProfileController());
    Get.lazyPut<AuthController>(() => AuthController());
  }
}
