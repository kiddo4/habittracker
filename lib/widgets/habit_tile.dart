import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class HabitTile extends StatelessWidget {
  final String text;
  final bool isCompleted;
  final void Function(bool?)? onChanged;
  final void Function(BuildContext?)? editHabit;
  final void Function(BuildContext?)? deleteHabit;
  const HabitTile(
      {required this.text,
      required this.isCompleted,
      required this.onChanged,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Slidable(
      endActionPane: ActionPane(
        motion: const StretchMotion(), 
        children: [
          SlidableAction(
            onPressed: editHabit,
            icon: Icons.edit,
            backgroundColor: Colors.grey.shade800,
            borderRadius: BorderRadius.circular(10),

            ),

            SlidableAction(
          onPressed: deleteHabit,
          icon: Icons.delete,
          backgroundColor:  Colors.red,
          borderRadius: BorderRadius.circular(10),
        )
        ]),
      child: GestureDetector(
        onTap: () {
          if (onChanged != null) {
            onChanged!(!isCompleted);
          }
          
        },
        child: Container(
          decoration: BoxDecoration(
            color: isCompleted
                ? Colors.green
                : Theme.of(context).colorScheme.secondary,
            borderRadius: BorderRadius.circular(10),
          ),
          padding: const EdgeInsets.all(8),
          margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
          child: ListTile(
              title: Text(text),
              leading: Checkbox(
                activeColor: Colors.green,
                value: isCompleted,
                onChanged: onChanged,
              )),
        ),
      ),
    );
  }
}
