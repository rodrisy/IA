import '../models/class_model.dart';
import '../models/schedules_model.dart';

void _printscheduleBlocks() {
  // make indices
  int dayIndex = 0;
  int periodIndex = 0;
  String userId = '0001';

  // print day 1 period 3

  BUser? foundUser =
      busers.firstWhere((user) => user.id == userId, orElse: null);

  print(foundUser);
}
