import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'sounds_screen.dart';
import 'garden_screen.dart';
import 'stats_screen.dart';

class MainNavigation extends StatefulWidget {
  const MainNavigation({super.key});

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const HomeScreen(),
    const SoundsScreen(),
    const GardenScreen(),
    const StatsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: NavigationBar(
        backgroundColor: Colors.white54,
        elevation: 0,
        selectedIndex: _selectedIndex,
        onDestinationSelected: (index) =>
            setState(() => _selectedIndex = index),
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.timer_outlined),
            label: 'Focus',
          ),
          NavigationDestination(
            icon: Icon(Icons.water_drop_outlined),
            label: 'Sounds',
          ),
          NavigationDestination(
            icon: Icon(Icons.yard_outlined),
            label: 'Garden',
          ),
          NavigationDestination(
            icon: Icon(Icons.bar_chart_rounded),
            label: 'Stats',
          ),
        ],
      ),
    );
  }
}
