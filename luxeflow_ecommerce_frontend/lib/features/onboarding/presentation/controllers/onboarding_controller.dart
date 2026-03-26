import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnboardingController extends GetxController {
  final PageController pageController = PageController();
  final RxInt currentPage = 0.obs;

  final List<Map<String, String>> onboardingData = [
    {
      'title': 'Explore Your\nStyle',
      'description': 'Experience the art of effortless acquisition. Encrypted, domestic, fast transactions tailored for your lifestyle.',
      'image': 'https://images.unsplash.com/photo-1490481651871-ab68de25d43d?auto=format&fit=crop&q=80&w=1000',
    },
    {
      'title': 'Fast &\nSecure',
      'description': 'Experience luxury in your daily life with our encrypted tracking and priority global logistics.',
      'image': 'https://images.unsplash.com/photo-1503376780353-7e6692767b70?auto=format&fit=crop&q=80&w=1000',
    },
    {
      'title': 'Seamless\nCheckout',
      'description': 'Experience the art of effortless acquisition. Encrypted, domestic, fast transactions tailored for your life style.',
      'image': 'https://images.unsplash.com/photo-1556742049-0cfed4f6a45d?auto=format&fit=crop&q=80&w=1000',
    },
  ];

  void onPageChanged(int index) {
    currentPage.value = index;
  }

  void nextPage() {
    if (currentPage.value < onboardingData.length - 1) {
      pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      Get.offAllNamed('/signup'); // Based on previous conversations, signup or login
    }
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }
}
