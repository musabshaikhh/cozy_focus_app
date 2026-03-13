import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants/colors.dart';

class SoundsScreen extends StatelessWidget {
  const SoundsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          const SizedBox(height: 40),
          Text(
            'Ambient Mixer 🌧',
            style: GoogleFonts.poppins(
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Text(
            'Mix your perfect focus sounds.',
            style: TextStyle(color: Colors.black54),
          ),
          const SizedBox(height: 32),
          _buildSoundSlider('Rainfall', Icons.beach_access, 0.6),
          _buildSoundSlider('Fireplace', Icons.fireplace, 0.2),
          _buildSoundSlider('Coffee Shop', Icons.coffee, 0.0),
          _buildSoundSlider('Forest Birds', Icons.wb_sunny, 0.4),
        ],
      ),
    );
  }

  Widget _buildSoundSlider(String label, IconData icon, double value) {
    return Container(
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(icon, size: 20),
                  const SizedBox(width: 8),
                  Text(
                    label,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Text(
                '${(value * 100).toInt()}%',
                style: TextStyle(color: Colors.black54),
              ),
            ],
          ),
          Slider(
            value: value,
            onChanged: (_) {},
            activeColor: AppColors.warmBrown,
            inactiveColor: AppColors.beige,
          ),
        ],
      ),
    );
  }
}
