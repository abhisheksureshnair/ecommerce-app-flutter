import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../data/repositories/auth_repository.dart';

class AuthController extends GetxController {
  final AuthRepository _repo = AuthRepository();

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final RxBool isLoading = false.obs;
  final RxBool isLoggedIn = false.obs;
  final RxnString error = RxnString();

  @override
  void onInit() {
    super.onInit();
    checkStatus();
  }

  Future<void> login() async {
    if (emailController.text.isEmpty || passwordController.text.isEmpty) {
      Get.snackbar('Error', 'Please fill in all fields', snackPosition: SnackPosition.BOTTOM);
      return;
    }
    
    isLoading.value = true;
    error.value = null;
    final success = await _repo.login(emailController.text, passwordController.text);
    if (success) {
      isLoggedIn.value = true;
      Get.offAllNamed('/main');
    } else {
      error.value = 'Login failed. Please check your credentials.';
      Get.snackbar('Error', error.value!, snackPosition: SnackPosition.BOTTOM);
    }
    isLoading.value = false;
  }

  Future<void> register() async {
    if (nameController.text.isEmpty || emailController.text.isEmpty || passwordController.text.isEmpty) {
       Get.snackbar('Error', 'Please fill in all fields', snackPosition: SnackPosition.BOTTOM);
      return;
    }

    isLoading.value = true;
    error.value = null;
    final success = await _repo.register(nameController.text, emailController.text, passwordController.text);
    if (success) {
      isLoggedIn.value = true;
      Get.offAllNamed('/main');
    } else {
      error.value = 'Registration failed.';
       Get.snackbar('Error', error.value!, snackPosition: SnackPosition.BOTTOM);
    }
    isLoading.value = false;
  }

  Future<void> logout() async {
    await _repo.logout();
    isLoggedIn.value = false;
    Get.offAllNamed('/login');
  }

  Future<void> checkStatus() async {
    isLoggedIn.value = await _repo.isLoggedIn();
  }

  @override
  void onClose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
