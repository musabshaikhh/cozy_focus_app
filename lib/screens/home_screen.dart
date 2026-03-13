import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants/colors.dart';
import '../widgets/task_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _secondsRemaining = 25 * 60;
  Timer? _timer;
  bool _isActive = false;

  void _toggleTimer() {
    if (_isActive) {
      _timer?.cancel();
    } else {
      _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
        setState(() {
          if (_secondsRemaining > 0) {
            _secondsRemaining--;
          } else {
            _timer?.cancel();
            _isActive = false;
          }
        });
      });
    }
    setState(() => _isActive = !_isActive);
  }

  String formatTime(int seconds) {
    final m = seconds ~/ 60;
    final s = seconds % 60;
    return '${m.toString().padLeft(2, '0')}:${s.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'CozyFocus ☕',
                    style: GoogleFonts.poppins(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: AppColors.warmBrown,
                    ),
                  ),
                  const CircleAvatar(
                    backgroundColor: AppColors.beige,
                    child: Icon(
                      Icons.person_outline,
                      color: AppColors.warmBrown,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 40),
              // Timer Section
              _buildTimerCard(),
              const SizedBox(height: 32),
              // Task Section
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Today\'s Tasks',
                  style: GoogleFonts.poppins(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              const TaskItem(text: 'Design Flutter UI', isDone: true),
              const TaskItem(text: 'Setup State Management', isDone: false),
              const TaskItem(text: 'Grow Focus Garden', isDone: false),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTimerCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: Colors.white54,
        borderRadius: BorderRadius.circular(40),
        border: Border.all(color: Colors.white),
      ),
      child: Column(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              SizedBox(
                width: 200,
                height: 200,
                child: CircularProgressIndicator(
                  value: _secondsRemaining / (25 * 60),
                  strokeWidth: 8,
                  backgroundColor: AppColors.beige,
                  color: AppColors.softGreen,
                  strokeCap: StrokeCap.round,
                ),
              ),
              Column(
                children: [
                  Text(
                    formatTime(_secondsRemaining),
                    style: GoogleFonts.poppins(
                      fontSize: 48,
                      fontWeight: FontWeight.bold,
                      letterSpacing: -2,
                    ),
                  ),
                  Text(
                    _isActive ? 'FOCUSING' : 'PAUSED',
                    style: const TextStyle(
                      fontSize: 10,
                      letterSpacing: 2,
                      color: Colors.black54,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 32),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: _toggleTimer,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.warmBrown,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 32,
                    vertical: 16,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: Text(_isActive ? 'Pause' : 'Start Focus'),
              ),
              const SizedBox(width: 12),
              IconButton.filledTonal(
                onPressed: () => setState(() {
                  _timer?.cancel();
                  _isActive = false;
                  _secondsRemaining = 25 * 60;
                }),
                icon: const Icon(Icons.refresh),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
