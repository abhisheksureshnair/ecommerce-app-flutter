import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/widgets/glass_container.dart';
import 'package:google_fonts/google_fonts.dart';
import '../controllers/home_controller.dart';

class CategoryChips extends GetView<HomeController> {
  const CategoryChips({super.key});

  @override
  Widget build(BuildContext context) {
    final categories = ['All', 'Apparel', 'Accessories', 'Footwear', 'Fragrance'];

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      physics: const BouncingScrollPhysics(),
      child: Row(
        children: List.generate(
          categories.length,
          (index) => Padding(
            padding: const EdgeInsets.only(right: 12),
            child: GestureDetector(
              onTap: () => controller.selectCategory(categories[index]),
              child: Obx(() {
                final selectedCategory = controller.selectedCategory.value;
                return GlassContainer(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  borderRadius: 24,
                  opacity: selectedCategory == categories[index] ? 0.3 : 0.05,
                  borderColor: selectedCategory == categories[index]
                      ? Theme.of(context).primaryColor
                      : Colors.white12,
                  child: Text(
                    categories[index],
                    style: GoogleFonts.outfit(
                      fontSize: 14,
                      color: selectedCategory == categories[index] ? Colors.white : Colors.white60,
                      fontWeight:
                          selectedCategory == categories[index] ? FontWeight.bold : FontWeight.normal,
                    ),
                  ),
                );
              }),
            ),
          ),
        ),
      ),
    );
  }
}

