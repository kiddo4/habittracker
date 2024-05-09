

import 'package:habittracker/models/habit.dart';

bool isHabitCompletedToday(List<DateTime> completedDays) {
  final today = DateTime.now();

  return completedDays.any((date) =>
      date.year == today.year &&
      date.month == today.month &&
      date.day == today.day);
}

Map<DateTime, int> getDatasets(List<Habit> habits) {
   Map<DateTime, int> datasets = {};

   for (var habit in habits) {
     for (var date in habit.completedDays) {

      final normalizedDate = DateTime(date.year, date.month, date.day);

      if (datasets.containsKey(normalizedDate)) {
        datasets[normalizedDate] = datasets[normalizedDate]! + 1;
      } else {
        datasets[normalizedDate] = 1;
     }
     }
   }
    return datasets;
}