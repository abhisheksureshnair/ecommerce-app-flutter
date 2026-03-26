import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mesh_gradient/mesh_gradient.dart';
import 'package:luxentia_ecommerce/features/cart/presentation/controllers/cart_controller.dart';
import 'package:luxentia_ecommerce/features/product/data/models/product.dart';
import 'package:luxentia_ecommerce/features/wishlist/presentation/controllers/wishlist_controller.dart';
import 'package:luxentia_ecommerce/features/home/presentation/controllers/main_controller.dart';
import '../../../../core/widgets/glass_container.dart';
import 'package:luxentia_ecommerce/features/home/presentation/controllers/home_controller.dart';
import 'package:luxentia_ecommerce/features/product/presentation/widgets/product_card.dart';

class ProductDetailsScreen extends StatelessWidget {
  final Product product;

  const ProductDetailsScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final cartController = Get.find<CartController>();

    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          // Mesh Gradient Background
          Positioned.fill(
            child: Opacity(
              opacity: 0.4,
              child: ExcludeSemantics(
                child: AnimatedMeshGradient(
                  colors: [
                    Theme.of(context).primaryColor.withValues(alpha: 0.5),
                    Colors.black,
                    Theme.of(context).colorScheme.secondary.withValues(alpha: 0.3),
                    Colors.black,
                  ],
                  options: AnimatedMeshGradientOptions(
                    speed: 2,
                    frequency: 5,
                    amplitude: 2,
                  ),
                ),
              ),
            ),
          ),
          CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              SliverAppBar(
                expandedHeight: 450,
                backgroundColor: Colors.transparent,
                elevation: 0,
                flexibleSpace: FlexibleSpaceBar(
                  background: Hero(
                    tag: 'product_image_${product.id}',
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(product.imageUrl),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.black.withValues(alpha: 0.4),
                              Colors.transparent,
                              Colors.black,
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                leading: IconButton(
                  icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white),
                  onPressed: () => Get.back(),
                ),
                actions: [
                  Obx(() {
                    final wishlistController = Get.find<WishlistController>();
                    bool isFavorite = wishlistController.isInWishlist(product.id);
                    return IconButton(
                      icon: Icon(
                        isFavorite ? Icons.favorite : Icons.favorite_border,
                        color: isFavorite ? Colors.redAccent : Colors.white,
                      ),
                      onPressed: () => wishlistController.toggleWishlist(product),
                    );
                  }),
                ],
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                            decoration: BoxDecoration(
                              color: Theme.of(context).primaryColor.withValues(alpha: 0.2),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Text(
                              product.category,
                              style: Theme.of(context).textTheme.labelSmall?.copyWith(
                                color: Theme.of(context).primaryColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Row(
                            children: [
                              const Icon(Icons.star, color: Colors.amber, size: 18),
                              const SizedBox(width: 4),
                              Text(
                                product.rating.toString(),
                                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                ' (${product.reviewsCount} reviews)',
                                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                  color: Colors.white60,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Text(
                        product.name,
                        style: Theme.of(context).textTheme.displayLarge,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        '\$${product.price.toStringAsFixed(2)}',
                        style: Theme.of(context).textTheme.displayMedium?.copyWith(
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      const SizedBox(height: 24),
                      Text(
                        'About this product',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        product.description,
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: Colors.white70,
                          height: 1.6,
                        ),
                      ),
                      const SizedBox(height: 32),
                      _buildRelatedProducts(context),
                      const SizedBox(height: 120),
                    ],
                  ),
                ),
              ),
            ],
          ),
          // Floating Cart Button
          Positioned(
            bottom: 32,
            left: 24,
            right: 24,
            child: GlassContainer(
              padding: const EdgeInsets.all(16),
              borderRadius: 30,
              opacity: 0.15,
              child: Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        cartController.addToCart(product);
                        Get.snackbar(
                          'Added to collection',
                          '${product.name} added to curated collection',
                          snackPosition: SnackPosition.BOTTOM,
                          backgroundColor: Theme.of(context).primaryColor.withValues(alpha: 0.8),
                          colorText: Colors.white,
                          margin: const EdgeInsets.all(24),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(context).primaryColor,
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        elevation: 10,
                        shadowColor: Theme.of(context).primaryColor.withValues(alpha: 0.5),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: Text(
                        'Add to Cart',
                        style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.2,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  GestureDetector(
                    onTap: () {
                      Get.find<MainController>().changeIndex(2);
                      Get.back();
                    },
                    child: Container(
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                        color: Colors.white10,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Icon(Icons.shopping_bag_outlined, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRelatedProducts(BuildContext context) {
    // We use Get.find within an Obx to reactively update the list
    return Obx(() {
      final homeController = Get.find<HomeController>();
      final relatedProducts = homeController.products
          .where((p) => p.category == product.category && p.id != product.id)
          .toList();

      if (relatedProducts.isEmpty) {
        return const SizedBox.shrink();
      }

      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'You May Also Like',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.1,
                ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            height: 320,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: relatedProducts.length,
              physics: const BouncingScrollPhysics(),
              clipBehavior: Clip.none,
              itemBuilder: (context, index) {
                final relatedProduct = relatedProducts[index];
                return Container(
                  width: 180,
                  margin: const EdgeInsets.only(right: 20),
                  child: ProductCard(
                    index: 0, // Using fixed index for consistent portrait aspect ratio in horizontal list
                    product: relatedProduct,
                    onTap: () {
                      Get.to(
                        () => ProductDetailsScreen(product: relatedProduct),
                        preventDuplicates: false,
                        transition: Transition.rightToLeftWithFade,
                      );
                    },
                  ),
                );
              },
            ),
          ),
        ],
      );
    });
  }
}

