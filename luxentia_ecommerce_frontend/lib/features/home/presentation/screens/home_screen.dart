import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:luxentia_ecommerce/features/product/presentation/widgets/product_card.dart';
import 'package:luxentia_ecommerce/features/product/presentation/screens/product_details_screen.dart';
import 'package:luxentia_ecommerce/features/home/presentation/widgets/category_chips.dart';
import 'package:luxentia_ecommerce/features/home/presentation/widgets/top_section.dart';
import '../controllers/home_controller.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    int crossAxisCount = screenWidth > 1200 ? 4 : (screenWidth > 800 ? 3 : 2);

    return Scaffold(
      backgroundColor: Colors.black,
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                const SizedBox(height: 20),
                const TopSection(),
                const SizedBox(height: 32),
              ]),
            ),
          ),
          SliverPersistentHeader(
            pinned: true,
            delegate: _CategoryHeaderDelegate(
              child: Container(
                height: 70,
                color: Colors.black,
                padding: const EdgeInsets.symmetric(horizontal: 24),
                alignment: Alignment.center,
                child: const CategoryChips(),
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                const SizedBox(height: 32),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Featured Pieces',
                      style: Theme.of(context).textTheme.displaySmall?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        'View All',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
              ]),
            ),
          ),
          Obx(() {
            if (controller.isLoading.value) {
              return const SliverToBoxAdapter(
                child: Center(child: CircularProgressIndicator(color: Colors.white)),
              );
            }

            final products = controller.filteredProducts;

            if (products.isEmpty) {
              return SliverToBoxAdapter(
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(40.0),
                    child: Text('No pieces in ${controller.selectedCategory.value}',
                        style: const TextStyle(color: Colors.white60)),
                  ),
                ),
              );
            }

            return SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              sliver: SliverMasonryGrid.count(
                crossAxisCount: crossAxisCount,
                mainAxisSpacing: 24,
                crossAxisSpacing: 24,
                itemBuilder: (context, index) {
                  final product = products[index];
                  return AnimationConfiguration.staggeredGrid(
                    position: index,
                    duration: const Duration(milliseconds: 600),
                    columnCount: crossAxisCount,
                    child: ScaleAnimation(
                      scale: 0.9,
                      child: FadeInAnimation(
                        child: ProductCard(
                          index: index,
                          product: product,
                          onTap: () {
                            Get.to(() => ProductDetailsScreen(product: product));
                          },
                        ),
                      ),
                    ),
                  );
                },
                childCount: products.length,
              ),
            );
          }),
          const SliverToBoxAdapter(child: SizedBox(height: 120)),
        ],
      ),
    );
  }
}


class _CategoryHeaderDelegate extends SliverPersistentHeaderDelegate {
  final Widget child;

  _CategoryHeaderDelegate({required this.child});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return child;
  }

  @override
  double get maxExtent => 70.0;

  @override
  double get minExtent => 70.0;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
