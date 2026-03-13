import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants/colors.dart';

class GardenScreen extends StatelessWidget {
  const GardenScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 200,
              height: 200,
              decoration: const BoxDecoration(
                color: AppColors.softGreen,
                shape: BoxShape.circle,
              ),
              child: const Center(
                child: Text('🌿', style: TextStyle(fontSize: 80)),
              ),
            ),
            const SizedBox(height: 24),
            Text(
              'Level 4 Caretaker',
              style: GoogleFonts.poppins(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Text(
              'Next reward: Oak Tree 🌳',
              style: TextStyle(color: Colors.black54),
            ),
            const SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: LinearProgressIndicator(
                value: 0.7,
                minHeight: 12,
                borderRadius: BorderRadius.circular(10),
                color: AppColors.softGreen,
                backgroundColor: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
