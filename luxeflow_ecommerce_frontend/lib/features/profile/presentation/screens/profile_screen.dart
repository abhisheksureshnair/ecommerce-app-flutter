import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../core/widgets/glass_container.dart';
import '../controllers/profile_controller.dart';
import 'package:luxeflow_ecommerce/features/wishlist/presentation/screens/wishlist_screen.dart';
import './edit_profile_screen.dart';
import './profile_feature_screen.dart';
import './track_order_screen.dart';

class ProfileScreen extends GetView<ProfileController> {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white),
          onPressed: () => Get.back(),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 40),
                GestureDetector(
                  onTap: () => Get.to(() => const EditProfileScreen()),
                  child: Stack(
                    children: [
                      const CircleAvatar(
                        radius: 50,
                        backgroundImage: NetworkImage(
                            'https://images.unsplash.com/photo-1544005313-94ddf0286df2?auto=format&fit=crop&q=80&w=300'),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          padding: const EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            color: Theme.of(context).primaryColor,
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(Icons.edit, color: Colors.white, size: 14),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  'Elena Vance',
                  style: GoogleFonts.outfit(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Text(
                  'elena.vance@luxeflow.com',
                  style: GoogleFonts.outfit(
                    fontSize: 14,
                    color: Colors.white54,
                  ),
                ),
                 const SizedBox(height: 40),
                _buildProfileItem(Icons.favorite_border, 'Willing List',
                    onTap: () => Get.to(() => const WishlistScreen())),
                _buildProfileItem(Icons.local_shipping_outlined, 'Track Order',
                    onTap: () => Get.to(() => const TrackOrderScreen())),
                _buildProfileItem(Icons.security_outlined, 'Security & Privacy',
                    onTap: () => Get.to(() => const ProfileFeatureScreen(
                        title: 'Security & Privacy', icon: Icons.security_outlined))),
                _buildProfileItem(Icons.tune_outlined, 'Preferences',
                    onTap: () => Get.to(() => const ProfileFeatureScreen(
                        title: 'Preferences', icon: Icons.tune_outlined))),
                _buildProfileItem(Icons.notifications_outlined, 'Notifications',
                    onTap: () => Get.to(() => const ProfileFeatureScreen(
                        title: 'Notifications', icon: Icons.notifications_outlined))),
                const SizedBox(height: 24),
                GestureDetector(
                  onTap: controller.logout,
                  child: GlassContainer(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                    borderRadius: 16,
                    borderColor: Colors.redAccent.withOpacity(0.5),
                    opacity: 0.1,
                    child: Row(
                      children: [
                        const Icon(Icons.logout, color: Colors.redAccent),
                        const SizedBox(width: 16),
                        Text(
                          'Log Out',
                          style: GoogleFonts.outfit(
                            color: Colors.redAccent,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 100), // padding for bottom nav
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildProfileItem(IconData icon, String title, {VoidCallback? onTap}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: GestureDetector(
        onTap: onTap,
        child: GlassContainer(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        borderRadius: 16,
        child: Row(
          children: [
            Icon(icon, color: Colors.white, size: 24),
            const SizedBox(width: 16),
            Text(
              title,
              style: GoogleFonts.outfit(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            const Spacer(),
            const Icon(Icons.arrow_forward_ios, color: Colors.white54, size: 16),
          ],
        ),
      ),
    ),
   );
  }
}

