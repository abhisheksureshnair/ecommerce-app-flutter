import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../core/widgets/glass_container.dart';

class TrackOrderScreen extends StatelessWidget {
  const TrackOrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'Track My Curations',
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildOrderCard(
              orderId: 'LXF-009214',
              date: 'Purchased March 26, 2026',
              status: 'Departing Paris Atelier',
              imageUrl: 'https://images.unsplash.com/photo-1542291026-7eec264c27ff?auto=format&fit=crop&q=80&w=300',
            ),
            const SizedBox(height: 40),
            Text(
              'Journey Progress',
              style: GoogleFonts.outfit(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 24),
            _buildTimelineStep(
              title: 'Acquisition Secured',
              subtitle: 'Awaiting Master Artisan validation.',
              time: 'March 26, 10:15 AM',
              isCompleted: true,
            ),
            _buildTimelineStep(
              title: 'Quality Certification',
              subtitle: 'LuxeFlow excellence check completed.',
              time: 'March 26, 02:30 PM',
              isCompleted: true,
            ),
            _buildTimelineStep(
              title: 'Atelier Departure',
              subtitle: 'Currently in transit from international hub.',
              time: 'In Progress',
              isCompleted: true,
              isActive: true,
            ),
            _buildTimelineStep(
              title: 'Global Logistics Hub',
              subtitle: 'Securing international express passage.',
              time: 'Pending',
              isCompleted: false,
            ),
            _buildTimelineStep(
              title: 'Final Destination reached',
              subtitle: 'Estimated personal delivery in person.',
              time: 'March 30',
              isCompleted: false,
              isLast: true,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOrderCard({required String orderId, required String date, required String status, required String imageUrl}) {
    return GlassContainer(
      padding: const EdgeInsets.all(20),
      borderRadius: 24,
      child: Column(
        children: [
          Row(
            children: [
              Container(
                height: 80,
                width: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  image: DecorationImage(image: NetworkImage(imageUrl), fit: BoxFit.cover),
                  border: Border.all(color: Colors.white10),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Order #$orderId',
                      style: GoogleFonts.outfit(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      date,
                      style: GoogleFonts.outfit(color: Colors.white38, fontSize: 12),
                    ),
                    const SizedBox(height: 12),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                      decoration: BoxDecoration(
                        color: const Color(0xFFC7B8F5).withOpacity(0.15),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        status,
                        style: GoogleFonts.outfit(color: const Color(0xFFC7B8F5), fontSize: 10, fontWeight: FontWeight.bold, letterSpacing: 0.5),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          const Divider(color: Colors.white10),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Contact Atelier', style: GoogleFonts.outfit(color: Colors.white54, fontSize: 12, fontWeight: FontWeight.w600)),
              Text('Manage Order', style: GoogleFonts.outfit(color: const Color(0xFFC7B8F5), fontSize: 12, fontWeight: FontWeight.w600)),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildTimelineStep({
    required String title,
    required String subtitle,
    required String time,
    required bool isCompleted,
    bool isActive = false,
    bool isLast = false,
  }) {
    return IntrinsicHeight(
      child: Row(
        children: [
          Column(
            children: [
              Container(
                height: 20,
                width: 20,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: isCompleted ? const Color(0xFFC7B8F5) : Colors.white10,
                  boxShadow: isCompleted ? [
                    BoxShadow(color: const Color(0xFFC7B8F5).withOpacity(0.4), blurRadius: 10)
                  ] : null,
                ),
                child: isCompleted ? const Icon(Icons.check, size: 12, color: Colors.black) : null,
              ),
              if (!isLast)
                Expanded(
                  child: Container(
                    width: 2,
                    margin: const EdgeInsets.symmetric(vertical: 4),
                    color: isCompleted ? const Color(0xFFC7B8F5).withOpacity(0.3) : Colors.white10,
                  ),
                ),
            ],
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      title,
                      style: GoogleFonts.outfit(
                        color: isCompleted ? Colors.white : Colors.white24,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      time,
                      style: GoogleFonts.outfit(color: Colors.white24, fontSize: 10),
                    ),
                  ],
                ),
                const SizedBox(height: 6),
                Text(
                  subtitle,
                  style: GoogleFonts.outfit(color: Colors.white38, fontSize: 13),
                ),
                const SizedBox(height: 32),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
