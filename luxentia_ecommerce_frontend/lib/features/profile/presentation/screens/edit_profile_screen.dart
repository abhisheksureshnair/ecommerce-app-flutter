import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../core/widgets/glass_container.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'Edit Profile',
          style: GoogleFonts.outfit(fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white),
          onPressed: () => Get.back(),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            Stack(
              children: [
                const CircleAvatar(
                  radius: 60,
                  backgroundImage: NetworkImage(
                      'https://images.unsplash.com/photo-1544005313-94ddf0286df2?auto=format&fit=crop&q=80&w=300'),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.camera_alt, color: Colors.white, size: 20),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 40),
            _buildTextField(label: 'Full Name', initialValue: 'Elena Vance'),
            const SizedBox(height: 20),
            _buildTextField(label: 'Email Address', initialValue: 'elena.vance@luxentia.com'),
            const SizedBox(height: 20),
            _buildTextField(label: 'Phone Number', initialValue: '+1 234 567 890'),
            const SizedBox(height: 40),
            SizedBox(
              width: double.infinity,
              height: 60,
              child: ElevatedButton(
                onPressed: () => Get.back(),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).primaryColor,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                ),
                child: Text(
                  'Save Changes',
                  style: GoogleFonts.outfit(fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField({required String label, required String initialValue}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: GoogleFonts.outfit(color: Colors.white70, fontSize: 14),
        ),
        const SizedBox(height: 8),
        GlassContainer(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          borderRadius: 16,
          child: TextField(
            controller: TextEditingController(text: initialValue),
            style: GoogleFonts.outfit(color: Colors.white),
            decoration: const InputDecoration(
              border: InputBorder.none,
            ),
          ),
        ),
      ],
    );
  }
}
