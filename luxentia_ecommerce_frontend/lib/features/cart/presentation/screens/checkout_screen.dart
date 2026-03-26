import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../core/widgets/glass_container.dart';
import '../controllers/cart_controller.dart';
import './order_success_screen.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cartController = Get.find<CartController>();
    
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Get.back(),
        ),
        title: Text(
          'Luxentia',
          style: GoogleFonts.outfit(
            color: const Color(0xFFC7B8F5), // Light purple from image
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_bag_outlined, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 24),
            _buildSectionHeader('Shipping Address', 'STEP 01 / 03'),
            const SizedBox(height: 16),
            _buildAddressCard(
              title: 'PRIMARY RESIDENCE',
              name: 'Alexander Vance',
              address: '720 Fifth Avenue, Floor 18\nNew York, NY 10019',
              isSelected: true,
            ),
            const SizedBox(height: 24),
            _buildAddressCard(
              title: 'SUMMER HOUSE',
              name: 'Alexander Vance',
              address: '100 Ocean Drive\nEast Hampton, NY 11937',
              isSelected: false,
            ),
            const SizedBox(height: 24),
            TextButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.add, color: Color(0xFFC7B8F5)),
              label: Text(
                'Add New Address',
                style: GoogleFonts.outfit(color: Colors.white, fontWeight: FontWeight.w600),
              ),
            ),
            const SizedBox(height: 40),
            _buildSectionHeader('Payment Method', 'STEP 02 / 03'),
            const SizedBox(height: 16),
            _buildPaymentCard(
              icon: Icons.credit_card,
              title: 'Visa Platinum',
              subtitle: 'Ending in •••• 8842',
              isSelected: true,
            ),
            const SizedBox(height: 12),
            _buildPaymentCard(
              icon: Icons.account_balance_wallet_outlined,
              title: 'Digital Wallet',
              subtitle: 'Apple Pay | Google Pay',
              isSelected: false,
            ),
            const SizedBox(height: 24),
            _buildPaymentForm(),
            const SizedBox(height: 48),
            _buildSectionHeader('Order Summary', '03 / 03'),
            const SizedBox(height: 24),
            ...cartController.cartItems.map((item) => _buildOrderSummaryItem(item)).toList(),
            const SizedBox(height: 32),
            _buildPriceRow('Subtotal', '\$${cartController.totalAmount.toStringAsFixed(2)}'),
            _buildPriceRow('Express Shipping', 'Free'),
            _buildPriceRow('Tax (NYC 8.875%)', '\$${(cartController.totalAmount * 0.08875).toStringAsFixed(2)}'),
            const Divider(color: Colors.white12, height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total',
                  style: GoogleFonts.outfit(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
                ),
                Text(
                  '\$${(cartController.totalAmount * 1.08875).toStringAsFixed(2)}',
                  style: GoogleFonts.outfit(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 40),
            Center(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.05),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.lock_outline, color: Colors.white54, size: 14),
                    const SizedBox(width: 8),
                    Text(
                      'SSL ENCRYPTED & 256-BIT SECURE',
                      style: GoogleFonts.outfit(color: Colors.white54, fontSize: 10, letterSpacing: 1),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              height: 64,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(32),
                  gradient: const LinearGradient(
                    colors: [Color(0xFFC7B8F5), Color(0xFF8B78FF)],
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFF8B78FF).withOpacity(0.4),
                      blurRadius: 20,
                      offset: const Offset(0, 10),
                    ),
                  ],
                ),
                child: ElevatedButton(
                  onPressed: () {
                    Get.to(() => const OrderSuccessScreen());
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    shadowColor: Colors.transparent,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Place Order',
                        style: GoogleFonts.outfit(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(width: 12),
                      const Icon(Icons.arrow_forward, size: 20),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Center(
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: GoogleFonts.outfit(color: Colors.white38, fontSize: 10, height: 1.5),
                  children: const [
                    TextSpan(text: 'BY PLACING YOUR ORDER, YOU AGREE TO\nLUXENTIA\'S '),
                    TextSpan(
                      text: 'TERMS OF SERVICE',
                      style: TextStyle(color: Colors.white70, decoration: TextDecoration.underline),
                    ),
                    TextSpan(text: ' AND '),
                    TextSpan(
                      text: 'PRIVACY POLICY',
                      style: TextStyle(color: Colors.white70, decoration: TextDecoration.underline),
                    ),
                    TextSpan(text: '.'),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 60),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(Icons.verified_user_outlined, color: Colors.white12, size: 20),
                SizedBox(width: 24),
                Icon(Icons.shield_outlined, color: Colors.white12, size: 20),
                SizedBox(width: 24),
                Icon(Icons.verified_outlined, color: Colors.white12, size: 20),
              ],
            ),
            const SizedBox(height: 16),
            Center(
              child: Text(
                'LUXENTIA ATELIER © 2024 • EXCELLENCE GUARANTEED',
                style: GoogleFonts.outfit(color: Colors.white10, fontSize: 10, fontWeight: FontWeight.w600),
              ),
            ),
            const SizedBox(height: 48),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title, String step) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: GoogleFonts.outfit(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
        ),
        Text(
          step,
          style: GoogleFonts.outfit(color: Colors.white30, fontSize: 12, fontWeight: FontWeight.bold, letterSpacing: 1),
        ),
      ],
    );
  }

  Widget _buildAddressCard({required String title, required String name, required String address, required bool isSelected}) {
    return GlassContainer(
      padding: const EdgeInsets.all(24),
      borderRadius: 24,
      borderColor: isSelected ? const Color(0xFFC7B8F5).withOpacity(0.5) : Colors.white10,
      opacity: isSelected ? 0.15 : 0.05,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: GoogleFonts.outfit(color: Colors.white38, fontSize: 10, fontWeight: FontWeight.bold, letterSpacing: 1),
              ),
              if (isSelected)
                const Icon(Icons.check_circle, color: Color(0xFFC7B8F5), size: 20),
            ],
          ),
          const SizedBox(height: 20),
          Text(
            name,
            style: GoogleFonts.outfit(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Text(
            address,
            style: GoogleFonts.outfit(color: Colors.white60, fontSize: 14, height: 1.5),
          ),
          const SizedBox(height: 16),
          Text(
            isSelected ? 'Edit' : 'Select Address',
            style: GoogleFonts.outfit(
              color: const Color(0xFFC7B8F5),
              fontSize: 12,
              fontWeight: FontWeight.bold,
              decoration: TextDecoration.underline,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPaymentCard({required IconData icon, required String title, required String subtitle, required bool isSelected}) {
    return GlassContainer(
      padding: const EdgeInsets.all(20),
      borderRadius: 24,
      borderColor: isSelected ? const Color(0xFFC7B8F5).withOpacity(0.5) : Colors.white10,
      opacity: isSelected ? 0.15 : 0.05,
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: Colors.white, size: 24),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GoogleFonts.outfit(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Text(
                  subtitle,
                  style: GoogleFonts.outfit(color: Colors.white38, fontSize: 12),
                ),
              ],
            ),
          ),
          Container(
            height: 24,
            width: 24,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: isSelected ? const Color(0xFFC7B8F5) : Colors.white24,
                width: 2,
              ),
            ),
            child: isSelected
                ? Center(
                    child: Container(
                      height: 12,
                      width: 12,
                      decoration: const BoxDecoration(
                        color: Color(0xFFC7B8F5),
                        shape: BoxShape.circle,
                      ),
                    ),
                  )
                : null,
          ),
        ],
      ),
    );
  }

  Widget _buildPaymentForm() {
    return Column(
      children: [
        _buildInput(label: 'CARD HOLDER', value: 'Alexander Vance'),
        const SizedBox(height: 16),
        _buildInput(label: 'CARD NUMBER', value: '•••• •••• •••• 8842'),
        const SizedBox(height: 16),
        Row(
          children: [
            Expanded(child: _buildInput(label: 'EXPIRY DATE', value: 'MM/YY')),
            const SizedBox(width: 16),
            Expanded(child: _buildInput(label: 'CVV', value: '•••')),
          ],
        ),
      ],
    );
  }

  Widget _buildInput({required String label, required String value}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: GoogleFonts.outfit(color: Colors.white38, fontSize: 10, fontWeight: FontWeight.bold, letterSpacing: 1),
        ),
        const SizedBox(height: 8),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.white.withOpacity(0.05)),
          ),
          child: Text(
            value,
            style: GoogleFonts.outfit(color: Colors.white60, fontSize: 14),
          ),
        ),
      ],
    );
  }

  Widget _buildOrderSummaryItem(item) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Row(
        children: [
          Container(
             height: 80,
            width: 80,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40),
              image: DecorationImage(
                image: NetworkImage(item.product.imageUrl),
                fit: BoxFit.cover,
              ),
              border: Border.all(color: Colors.white.withOpacity(0.1), width: 2),
            ),
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.product.name,
                  style: GoogleFonts.outfit(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 4),
                Text(
                  'Size: 42 • Qty: ${item.quantity}',
                  style: GoogleFonts.outfit(color: Colors.white38, fontSize: 12),
                ),
                const SizedBox(height: 4),
                Text(
                  '\$${item.product.price.toStringAsFixed(2)}',
                  style: GoogleFonts.outfit(color: const Color(0xFFC7B8F5), fontSize: 14, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPriceRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: GoogleFonts.outfit(color: Colors.white38, fontSize: 14),
          ),
          Text(
            value,
            style: GoogleFonts.outfit(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
