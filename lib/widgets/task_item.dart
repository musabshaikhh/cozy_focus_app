import 'package:flutter/material.dart';
import '../constants/colors.dart';

class TaskItem extends StatelessWidget {
  final String text;
  final bool isDone;
  const TaskItem({super.key, required this.text, required this.isDone});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white54,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Icon(
            isDone ? Icons.check_circle : Icons.radio_button_unchecked,
            color: isDone ? AppColors.softGreen : AppColors.beige,
          ),
          const SizedBox(width: 12),
          Text(
            text,
            style: TextStyle(
              decoration: isDone ? TextDecoration.lineThrough : null,
              color: isDone ? Colors.black38 : Colors.black,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
