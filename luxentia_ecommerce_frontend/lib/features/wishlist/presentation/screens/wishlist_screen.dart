import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:luxentia_ecommerce/features/product/presentation/widgets/product_card.dart';
import 'package:luxentia_ecommerce/features/product/presentation/screens/product_details_screen.dart';
import 'package:luxentia_ecommerce/features/wishlist/presentation/controllers/wishlist_controller.dart';
import 'package:google_fonts/google_fonts.dart';

class WishlistScreen extends GetView<WishlistController> {
  const WishlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'Willing List',
          style: GoogleFonts.outfit(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white),
          onPressed: () => Get.back(),
        ),
      ),
      body: Obx(() {
        if (controller.wishlistItems.isEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.favorite_border, size: 64, color: Colors.white24),
                const SizedBox(height: 16),
                Text(
                  'Your willing list is empty',
                  style: GoogleFonts.outfit(color: Colors.white54, fontSize: 18),
                ),
              ],
            ),
          );
        }

        return AnimationLimiter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: MasonryGridView.count(
              crossAxisCount: 2,
              mainAxisSpacing: 24,
              crossAxisSpacing: 24,
              itemCount: controller.wishlistItems.length,
              itemBuilder: (context, index) {
                final product = controller.wishlistItems[index];
                return AnimationConfiguration.staggeredGrid(
                  position: index,
                  duration: const Duration(milliseconds: 500),
                  columnCount: 2,
                  child: ScaleAnimation(
                    scale: 0.9,
                    child: FadeInAnimation(
                      child: ProductCard(
                        index: index,
                        product: product,
                        onTap: () => Get.to(() => ProductDetailsScreen(product: product)),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        );
      }),
    );
  }
}
