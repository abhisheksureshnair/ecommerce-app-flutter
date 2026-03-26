import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileFeatureScreen extends StatelessWidget {
  final String title;
  final IconData icon;

  const ProfileFeatureScreen({super.key, required this.title, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          title,
          style: GoogleFonts.outfit(fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white),
          onPressed: () => Get.back(),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 80, color: Colors.white12),
            const SizedBox(height: 24),
            Text(
              'Your $title settings',
              style: GoogleFonts.outfit(color: Colors.white54, fontSize: 18),
            ),
            const SizedBox(height: 8),
            Text(
              'Feature coming soon to Luxentia',
              style: GoogleFonts.outfit(color: Colors.white24, fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }
}
