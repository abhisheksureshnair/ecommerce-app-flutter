import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../core/widgets/glass_container.dart';
import '../controllers/cart_controller.dart';
import 'package:luxentia_ecommerce/features/product/presentation/screens/product_details_screen.dart';
import './checkout_screen.dart';

class CartScreen extends GetView<CartController> {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    bool isLargeScreen = MediaQuery.of(context).size.width > 800;

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Text(
              'Your Curated Collection',
              style: GoogleFonts.outfit(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 24),
            Expanded(
              child: Obx(() {
                final cartItems = controller.cartItems;
                if (cartItems.isEmpty) {
                  return Center(
                    child: Text(
                      'Your collection is empty...',
                      style: GoogleFonts.outfit(color: Colors.white54, fontSize: 18),
                    ),
                  );
                }
                return ListView.builder(
                  itemCount: cartItems.length,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    final item = cartItems[index];
                    final product = item.product;
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 16),
                      child: GestureDetector(
                        onTap: () => Get.to(() => ProductDetailsScreen(product: product)),
                        child: GlassContainer(
                          padding: const EdgeInsets.all(12),
                          borderRadius: 20,
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(16),
                                child: Image.network(
                                  product.imageUrl,
                                  height: 80,
                                  width: 80,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              const SizedBox(width: 16),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      product.name,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: GoogleFonts.outfit(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      '\$${product.price.toStringAsFixed(2)}',
                                      style: GoogleFonts.outfit(
                                        fontSize: 14,
                                        color: Theme.of(context).primaryColor,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    Row(
                                      children: [
                                        _buildQuantityButton(
                                            Icons.remove, () => controller.decrementQuantity(product.id)),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(horizontal: 12),
                                          child: Text(
                                            '${item.quantity}',
                                            style: GoogleFonts.outfit(color: Colors.white, fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        _buildQuantityButton(
                                            Icons.add, () => controller.incrementQuantity(product.id)),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                );
              }),
            ),
            const SizedBox(height: 16),
            Obx(() {
              if (controller.cartItems.isEmpty) return const SizedBox.shrink();
              return GlassContainer(
                padding: const EdgeInsets.all(20),
                borderRadius: 24,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'Total',
                            style: GoogleFonts.outfit(color: Colors.white60, fontSize: 14),
                          ),
                          FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Text(
                              '\$${controller.totalAmount.toStringAsFixed(2)}',
                              style: GoogleFonts.outfit(
                                color: Colors.white,
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 16),
                    ElevatedButton(
                      onPressed: () {
                        Get.to(() => const CheckoutScreen());
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(context).primaryColor,
                        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                      ),
                      child: Text(
                        'Checkout',
                        style: GoogleFonts.outfit(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                  ],
                ),
              );
            }),
            SizedBox(height: isLargeScreen ? 32 : 100), // conditional padding
          ],
        ),
      ),
    );
  }

  Widget _buildQuantityButton(IconData icon, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: Colors.white12,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(icon, color: Colors.white, size: 16),
      ),
    );
  }
}

