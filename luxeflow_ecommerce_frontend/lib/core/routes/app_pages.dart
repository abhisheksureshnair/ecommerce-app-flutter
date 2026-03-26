import 'package:get/get.dart';
import 'app_routes.dart';
import '../../../features/onboarding/presentation/screens/onboarding_screen.dart';
import '../../../features/onboarding/presentation/bindings/onboarding_binding.dart';
import '../../../features/auth/presentation/screens/login_screen.dart';
import '../../../features/auth/presentation/screens/signup_screen.dart';
import '../../../features/auth/presentation/bindings/auth_binding.dart';
import '../../../features/home/presentation/screens/main_screen.dart';
import '../../../features/home/presentation/bindings/home_binding.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: AppRoutes.ONBOARDING,
      page: () => const OnboardingScreen(),
      binding: OnboardingBinding(),
    ),
    GetPage(
      name: AppRoutes.LOGIN,
      page: () => const LoginScreen(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: AppRoutes.SIGNUP,
      page: () => const SignupScreen(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: AppRoutes.MAIN,
      page: () => const MainScreen(),
      binding: HomeBinding(),
    ),
  ];
}
