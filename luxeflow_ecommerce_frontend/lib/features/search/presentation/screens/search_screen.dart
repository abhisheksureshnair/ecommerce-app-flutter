import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:luxeflow_ecommerce/features/product/presentation/screens/product_details_screen.dart';
import '../../../../core/widgets/glass_container.dart';
import '../controllers/app_search_controller.dart';

class SearchScreen extends GetView<AppSearchController> {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Text(
                'Search',
                style: GoogleFonts.outfit(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 20),
              GlassContainer(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                borderRadius: 16,
                child: TextField(
                  onChanged: controller.updateSearchQuery,
                  style: GoogleFonts.outfit(color: Colors.white),
                  decoration: InputDecoration(
                    hintText: 'Search our curated collections...',
                    hintStyle: GoogleFonts.outfit(color: Colors.white54),
                    border: InputBorder.none,
                    icon: const Icon(Icons.search, color: Colors.white54),
                  ),
                ),
              ),
              const SizedBox(height: 32),
              Expanded(
                child: Obx(() {
                  if (controller.isLoading.value) {
                    return const Center(child: CircularProgressIndicator(color: Colors.white));
                  }

                  final filteredProducts = controller.filteredProducts;

                  if (filteredProducts.isEmpty) {
                    return Center(
                      child: Text(
                        'No pieces found matching your criteria...',
                        style: GoogleFonts.outfit(color: Colors.white54),
                      ),
                    );
                  }

                  return ListView.builder(
                    itemCount: filteredProducts.length,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      final product = filteredProducts[index];
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 12),
                        child: GestureDetector(
                          onTap: () {
                            Get.to(() => ProductDetailsScreen(product: product));
                          },
                          child: GlassContainer(
                            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                            borderRadius: 12,
                            opacity: 0.05,
                            child: Row(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Image.network(
                                    product.imageUrl,
                                    height: 60,
                                    width: 60,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                const SizedBox(width: 16),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        product.name,
                                        style: GoogleFonts.outfit(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        product.category,
                                        style: GoogleFonts.outfit(
                                          color: Colors.white54,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Text(
                                  '\$${product.price.toStringAsFixed(0)}',
                                  style: GoogleFonts.outfit(
                                    color: Theme.of(context).primaryColor,
                                    fontWeight: FontWeight.bold,
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
            ],
          ),
        ),
      ),
    );
  }
}

