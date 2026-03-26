import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../core/widgets/glass_container.dart';
import 'package:get/get.dart';
import 'package:luxentia_ecommerce/features/profile/presentation/screens/profile_screen.dart';

class TopSection extends StatelessWidget {
  const TopSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Luxentia',
                  style: GoogleFonts.outfit(
                    fontSize: 16,
                    fontWeight: FontWeight.w100,
                    color: Colors.white,
                  ),
                ),
                Text(
                  'The Ethereal Atelier',
                  style: GoogleFonts.outfit(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            GestureDetector(
              onTap: () => Get.to(() => const ProfileScreen()),
              child: GlassContainer(
                padding: const EdgeInsets.all(12),
                borderRadius: 16,
                opacity: 0.1,
                child: const Icon(
                  Icons.person_outline,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
