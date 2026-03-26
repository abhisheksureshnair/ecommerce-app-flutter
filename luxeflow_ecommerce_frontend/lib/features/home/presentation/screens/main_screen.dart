import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'home_screen.dart';
import '../../../../core/widgets/glass_container.dart';
import '../../../search/presentation/screens/search_screen.dart';
import '../../../cart/presentation/screens/cart_screen.dart';
import 'chatbot_screen.dart';
import '../controllers/main_controller.dart';

class MainScreen extends GetView<MainController> {
  const MainScreen({super.key});

  final List<Widget> _screens = const [
    HomeScreen(),
    SearchScreen(),
    CartScreen(),
    ChatBotScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        bottom: false,
        child: LayoutBuilder(
        builder: (context, constraints) {
          bool isLargeScreen = constraints.maxWidth > 800;
          
          if (isLargeScreen) {
            return Row(
              children: [
                _buildSidebar(context),
                Expanded(
                  child: Obx(() => _screens[controller.selectedIndex.value]),
                ),
              ],
            );
          }

          return Stack(
            fit: StackFit.expand,
            children: [
              Obx(() => _screens[controller.selectedIndex.value]),
              Positioned(
                left: 24,
                right: 24,
                bottom: 32,
                child: GlassContainer(
                  padding: EdgeInsets.zero,
                  borderRadius: 30,
                  child: Obx(() {
                    if (controller.selectedIndex.value == 3) return const SizedBox.shrink();
                    return GlassContainer(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      borderRadius: 30,
                      opacity: 0.1,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          _buildNavItem(context, 0, Icons.grid_view_rounded),
                          _buildNavItem(context, 1, Icons.search_rounded),
                          _buildNavItem(context, 2, Icons.shopping_bag_outlined),
                          _buildNavItem(context, 3, Icons.auto_awesome_rounded),
                        ],
                      ),
                    );
                  }),
                ),
              ),
            ],
          );
        },
      ),
    ),
  );
}

  Widget _buildSidebar(BuildContext context) {
    return Container(
      width: 250,
      decoration: BoxDecoration(
        color: Colors.black,
        border: Border(right: BorderSide(color: Colors.white.withValues(alpha: 0.1), width: 1)),
      ),
      child: Column(
        children: [
          const SizedBox(height: 50),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Row(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Icon(Icons.auto_awesome, color: Colors.white),
                ),
                const SizedBox(width: 12),
                const Text(
                  'LUXEFLOW',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w900,
                    letterSpacing: 2,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 60),
          _buildSidebarItem(context, 0, Icons.grid_view_rounded, 'Overview'),
          _buildSidebarItem(context, 1, Icons.search_rounded, 'Search'),
          _buildSidebarItem(context, 2, Icons.shopping_bag_outlined, 'Bag'),
          _buildSidebarItem(context, 3, Icons.auto_awesome_rounded, 'Concierge'),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: GlassContainer(
              borderRadius: 20,
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  const Text('Need Help?', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  const Text('Chat with our AI Assistant 24/7', style: TextStyle(color: Colors.white60, fontSize: 12), textAlign: TextAlign.center),
                  const SizedBox(height: 12),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () => controller.changeIndex(3),
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                      ),
                      child: const Text('Start Chat', style: TextStyle(fontSize: 12)),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 30),
        ],
      ),
    );
  }

  Widget _buildSidebarItem(BuildContext context, int index, IconData icon, String label) {
    return Obx(() {
      bool isSelected = controller.selectedIndex.value == index;
      return InkWell(
        onTap: () => controller.changeIndex(index),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
          decoration: BoxDecoration(
            border: Border(
              left: BorderSide(
                color: isSelected ? Theme.of(context).primaryColor : Colors.transparent,
                width: 4,
              ),
            ),
            gradient: isSelected
                ? LinearGradient(
                    colors: [Theme.of(context).primaryColor.withValues(alpha: 0.1), Colors.transparent],
                  )
                : null,
          ),
          child: Row(
            children: [
              Icon(
                icon,
                color: isSelected ? Theme.of(context).primaryColor : Colors.white60,
              ),
              const SizedBox(width: 16),
              Text(
                label,
                style: TextStyle(
                  color: isSelected ? Colors.white : Colors.white60,
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                ),
              ),
            ],
          ),
        ),
      );
    });
  }

  Widget _buildNavItem(BuildContext context, int index, IconData icon) {
    return GestureDetector(
      onTap: () => controller.changeIndex(index),
      child: Obx(() {
        bool isSelected = controller.selectedIndex.value == index;
        return AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: isSelected ? Theme.of(context).primaryColor.withValues(alpha: 0.2) : Colors.transparent,
            shape: BoxShape.circle,
          ),
          child: Icon(
            icon,
            color: isSelected ? Theme.of(context).primaryColor : Colors.white60,
            size: 26,
          ),
        );
      }),
    );
  }
}

