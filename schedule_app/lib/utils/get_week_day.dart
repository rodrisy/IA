import 'package:intl/intl.dart';

DateTime calculateCurrentDay(DateTime today, int dayDifference) {
  DateTime currentDate = today.add(Duration(days: dayDifference));

  while (currentDate.weekday > 5) {
    // If it's Saturday or Sunday, add days to make it Monday
    currentDate = currentDate.add(Duration(days: 8 - currentDate.weekday));
  }
  return currentDate;
}

String formatDateEEEEddMMMMyyyy(DateTime date) {
  return DateFormat('EEEE dd "of" MMMM yyyy').format(date);
}

String formatDateEEEE(DateTime date) {
  return DateFormat('EEEE').format(date);
}
