import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'screens/main_navigation.dart';
import 'constants/colors.dart';

void main() {
  runApp(const CozyFocusApp());
}

class CozyFocusApp extends StatelessWidget {
  const CozyFocusApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CozyFocus',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.warmBrown,
          primary: AppColors.warmBrown,
          surface: AppColors.background,
          secondary: AppColors.softGreen,
        ),
        textTheme: GoogleFonts.poppinsTextTheme(),
      ),
      home: const MainNavigation(),
    );
  }
}
