import 'package:flutter/material.dart';
import 'package:luxentia_ecommerce/features/product/data/models/product.dart';
import 'package:get/get.dart';
import 'package:luxentia_ecommerce/features/wishlist/presentation/controllers/wishlist_controller.dart';

class ProductCard extends StatelessWidget {
  final int index;
  final Product product;
  final VoidCallback onTap;

  const ProductCard({
    super.key,
    required this.index,
    required this.product,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AspectRatio(
            aspectRatio: index % 2 == 0 ? 0.8 : 1.2, // Masonry effect by varying aspect ratio
            child: Hero(
              tag: 'product_image_${product.id}',
              child: Stack(
                children: [
                  Container(
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24),
                      color: Colors.white10,
                    ),
                    child: Image.network(
                      product.imageUrl,
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: double.infinity,
                      loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress == null) return child;
                        return Center(
                          child: CircularProgressIndicator(
                            value: loadingProgress.expectedTotalBytes != null
                                ? loadingProgress.cumulativeBytesLoaded /
                                    loadingProgress.expectedTotalBytes!
                                : null,
                            strokeWidth: 2,
                          ),
                        );
                      },
                    ),
                  ),
                  Positioned(
                    top: 12,
                    right: 12,
                    child: Obx(() {
                      final wishlistController = Get.find<WishlistController>();
                      bool isFavorite = wishlistController.isInWishlist(product.id);
                      return GestureDetector(
                        onTap: () => wishlistController.toggleWishlist(product),
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Colors.black.withValues(alpha: 0.4),
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            isFavorite ? Icons.favorite : Icons.favorite_border,
                            color: isFavorite ? Colors.redAccent : Colors.white,
                            size: 20,
                          ),
                        ),
                      );
                    }),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 12),
          Text(
            product.name,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                product.category,
                style: Theme.of(context).textTheme.labelMedium?.copyWith(
                  color: Colors.white70,
                ),
              ),
              Text(
                '\$${product.price.toStringAsFixed(0)}',
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  fontWeight: FontWeight.w600,
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
