import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../core/widgets/glass_container.dart';
import '../controllers/main_controller.dart';

class ChatBotScreen extends StatelessWidget {
  const ChatBotScreen({super.key});

  @override
  Widget build(BuildContext context) {
    bool isLargeScreen = MediaQuery.of(context).size.width > 800;

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: isLargeScreen ? null : AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Column(
          children: [
            Text(
              'LuxeBot',
              style: GoogleFonts.outfit(fontWeight: FontWeight.bold),
            ),
            Text(
              'Online Concierge',
              style: GoogleFonts.outfit(fontSize: 12, color: const Color(0xFFC7B8F5)),
            ),
          ],
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.close, color: Colors.white60),
          onPressed: () {
            // Return to home tab
            Get.find<MainController>().changeIndex(0);
          },
        ),
      ),
      body: Column(
        children: [
          if (isLargeScreen) ...[
            const SizedBox(height: 50),
            Text(
              'LuxeBot Concierge',
              style: GoogleFonts.outfit(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.white),
            ),
            Text(
              'Your personal curator for the Ethereal Atelier',
              style: GoogleFonts.outfit(fontSize: 14, color: Colors.white54),
            ),
            const SizedBox(height: 30),
          ],
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 24),
              children: [
                _buildChatBubble(
                  'Welcome to the LuxeFlow Atelier, Elena. How may I assist your curation today?',
                  isBot: true,
                  isLargeScreen: isLargeScreen,
                ),
                _buildChatBubble(
                  'Can you suggest something for a Paris evening?',
                  isBot: false,
                  isLargeScreen: isLargeScreen,
                ),
                _buildChatBubble(
                  'Certainly. For a Parisian twilight, I recommend our silk-blend ateliers or the midnight velvet collection. Would you like to see our featured pieces?',
                  isBot: true,
                  isLargeScreen: isLargeScreen,
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(isLargeScreen ? 60 : 24),
            child: GlassContainer(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              borderRadius: 20,
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      style: GoogleFonts.outfit(color: Colors.white),
                      decoration: InputDecoration(
                        hintText: 'Consult your concierge...',
                        hintStyle: GoogleFonts.outfit(color: Colors.white30),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.send_rounded, color: Color(0xFFC7B8F5)),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ),
          if (isLargeScreen) const SizedBox(height: 40),
        ],
      ),
    );
  }

  Widget _buildChatBubble(String text, {required bool isBot, required bool isLargeScreen}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24),
      child: Column(
        crossAxisAlignment: isBot ? CrossAxisAlignment.start : CrossAxisAlignment.end,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            constraints: BoxConstraints(maxWidth: isLargeScreen ? 500 : 280),
            decoration: BoxDecoration(
              color: isBot ? Colors.white.withValues(alpha: 0.05) : const Color(0xFFC7B8F5).withValues(alpha: 0.2),
              borderRadius: BorderRadius.only(
                topLeft: const Radius.circular(20),
                topRight: const Radius.circular(20),
                bottomLeft: Radius.circular(isBot ? 4 : 20),
                bottomRight: Radius.circular(isBot ? 20 : 4),
              ),
              border: Border.all(
                color: isBot ? Colors.white.withValues(alpha: 0.05) : const Color(0xFFC7B8F5).withValues(alpha: 0.3),
              ),
            ),
            child: Text(
              text,
              style: GoogleFonts.outfit(color: Colors.white, fontSize: 14, height: 1.5),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            isBot ? 'LuxeBot • Just now' : 'You • Just now',
            style: GoogleFonts.outfit(color: Colors.white24, fontSize: 10),
          ),
        ],
      ),
    );
  }
}
