import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../core/widgets/glass_container.dart';
import 'package:luxeflow_ecommerce/features/home/presentation/controllers/main_controller.dart';
import 'package:luxeflow_ecommerce/core/routes/app_routes.dart';
import '../controllers/cart_controller.dart';

class OrderSuccessScreen extends StatelessWidget {
  const OrderSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          // Background Glow
          Positioned(
            top: -100,
            right: -100,
            child: Container(
              height: 400,
              width: 400,
              decoration: BoxDecoration(
                color: const Color(0xFF8B78FF).withOpacity(0.1),
                shape: BoxShape.circle,
              ),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Spacer(),
                  // Success Icon
                  Container(
                    height: 120,
                    width: 120,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: const LinearGradient(
                        colors: [Color(0xFFC7B8F5), Color(0xFF8B78FF)],
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xFF8B78FF).withOpacity(0.4),
                          blurRadius: 30,
                          offset: const Offset(0, 10),
                        ),
                      ],
                    ),
                    child: const Icon(Icons.check, color: Colors.white, size: 60),
                  ),
                  const SizedBox(height: 48),
                  Text(
                    'Order Confirmed',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.outfit(
                      color: Colors.white,
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Your luxury items are being prepared for their journey to you.',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.outfit(
                      color: Colors.white54,
                      fontSize: 16,
                      height: 1.5,
                    ),
                  ),
                  const SizedBox(height: 48),
                  GlassContainer(
                    padding: const EdgeInsets.all(24),
                    borderRadius: 24,
                    child: Column(
                      children: [
                        _buildInfoRow('Order ID', '#LXF-009214'),
                        const Divider(color: Colors.white10, height: 32),
                        _buildInfoRow('Estimated Delivery', 'March 30, 2026'),
                      ],
                    ),
                  ),
                  const Spacer(),
                  SizedBox(
                    width: double.infinity,
                    height: 64,
                    child: ElevatedButton(
                      onPressed: () {
                        // Clear cart
                        Get.find<CartController>().clearCart();
                        // Navigate to home
                        Get.find<MainController>().changeIndex(0);
                        Get.offAllNamed(AppRoutes.MAIN); 
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFC7B8F5),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
                      ),
                      child: Text(
                        'Continue Shopping',
                        style: GoogleFonts.outfit(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 48),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: GoogleFonts.outfit(color: Colors.white38, fontSize: 14),
        ),
        Text(
          value,
          style: GoogleFonts.outfit(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
