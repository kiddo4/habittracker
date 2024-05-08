import 'package:flutter/material.dart';

class HabitTile extends StatelessWidget {
  final String text;
  final bool isCompleted;
  final void Function(bool?)? onChanged;
  const HabitTile(
      {required this.text,
      required this.isCompleted,
      required this.onChanged,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color:
            isCompleted ? Colors.green : Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
    );
  }
}
