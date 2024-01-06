import 'dart:io';

import 'package:intl/intl.dart';
import 'package:schedule_app/models/schedules_model.dart';

int calculateCycleDay(DateTime currentDate, int cycleDays) {
  DateTime startDay = DateTime(currentDate.year, 1, 1);
  while (startDay.weekday != DateTime.monday) {
    startDay = startDay.add(Duration(days: 1));
  }

  int daysBetween = 0;
  String formattedStartDay = DateFormat('yyyyMMdd').format(startDay);
  while (startDay.isBefore(currentDate)) {
    if (startDay.weekday != DateTime.saturday &&
        startDay.weekday != DateTime.sunday &&
        !schedules[1].vacationDays.contains(formattedStartDay)) {
      daysBetween++;
    }
    startDay = startDay.add(Duration(days: 1));
  }

  int cycleDay = daysBetween % cycleDays;
  if (cycleDay == 0) {
    return cycleDays;
  } else {
    return cycleDay;
  }
}

String getUsername() {
  stdout.write("Enter your username: ");
  return stdin.readLineSync()!;
}

String ifUserExists(String username) {
  // Assuming you have a function to check if the user exists
  // and returning a message or something similar
  return "Checking user existence for $username...";
}

void main() {
  // State how many days in a cycle
  int cycleDays = 6;

  // State what day it is today
  int currentCycleDay = calculateCycleDay(DateTime.now(), cycleDays);

  // Print the result
  print("Today is cycle day: $currentCycleDay");

  // What is this user
  String username = getUsername();
  print("You are signed in as: $username");

  // Check if user exists
  String doesUserExist = ifUserExists(username);
  print(doesUserExist);
}
