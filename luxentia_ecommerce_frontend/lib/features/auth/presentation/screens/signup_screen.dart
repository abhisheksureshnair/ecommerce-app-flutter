import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../controllers/auth_controller.dart';

class SignupScreen extends GetView<AuthController> {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                IconButton(
                  onPressed: () => Get.back(),
                  icon: const Icon(Icons.arrow_back, color: Colors.white),
                ),
                const SizedBox(height: 20),
                Text(
                  'Create Account',
                  style: GoogleFonts.outfit(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Sign up to get started.',
                  style: GoogleFonts.outfit(
                    fontSize: 16,
                    color: Colors.white54,
                  ),
                ),
                const SizedBox(height: 48),
                Text(
                  'FULL NAME',
                  style: GoogleFonts.outfit(color: Colors.white54, fontSize: 12, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                TextField(
                  controller: controller.nameController,
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    hintText: 'Alex J.',
                    hintStyle: const TextStyle(color: Colors.white30),
                    filled: true,
                    fillColor: Colors.white10,
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
                  ),
                ),
                const SizedBox(height: 24),
                Text(
                  'EMAIL ADDRESS',
                  style: GoogleFonts.outfit(color: Colors.white54, fontSize: 12, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                TextField(
                  controller: controller.emailController,
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    hintText: 'alex@luxentia.com',
                    hintStyle: const TextStyle(color: Colors.white30),
                    filled: true,
                    fillColor: Colors.white10,
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
                  ),
                ),
                const SizedBox(height: 24),
                Text(
                  'PASSWORD',
                  style: GoogleFonts.outfit(color: Colors.white54, fontSize: 12, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                TextField(
                  controller: controller.passwordController,
                  obscureText: true,
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    hintText: '••••••••',
                    hintStyle: const TextStyle(color: Colors.white30),
                    filled: true,
                    fillColor: Colors.white10,
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
                  ),
                ),
                const SizedBox(height: 48),
                SizedBox(
                  width: double.infinity,
                  height: 56,
                  child: Obx(() => ElevatedButton(
                        onPressed: controller.isLoading.value ? null : controller.register,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF8A2BE2),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(28)),
                        ),
                        child: controller.isLoading.value
                            ? const SizedBox(
                                height: 20,
                                width: 20,
                                child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2),
                              )
                            : Text(
                                'Sign Up',
                                style: GoogleFonts.outfit(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                      )),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

