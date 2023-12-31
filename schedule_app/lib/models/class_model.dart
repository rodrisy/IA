import 'package:schedule_app/main.dart';

class Schedule {
  final String day;
  final List<Class> classes;

  Schedule(this.day, this.classes);
}

class Class {
  final String startTime;
  final String endTime;
  final String subject;
  final String teacher;
  final String room;

  Class(this.startTime, this.endTime, this.subject, this.teacher, this.room);
}

class User {
  final String id;
  final List<Schedule> schedules;

  User(
    this.id,
    this.schedules,
  );
}

//// I AM GOING INSANE

class BUser {
  final String id;
  final Map<String, BlockClass> blockDictionary;

  BUser({required this.id, required this.blockDictionary});
}

// class BlockSchedule {
//   final List<BlockClass> blockclasses;

//   BlockSchedule(this.blockclasses)
// }

class BlockClass {
  final String startTime;
  final String endTime;
  final String subject;
  final String teacher;
  final String room;

  BlockClass(
      this.startTime, this.endTime, this.subject, this.teacher, this.room);
}

// now the dwighjt schedule

class BlockSchedule {
  final String name;
  final List<BlockDay> blockdays;

  BlockSchedule(this.name, this.blockdays);
}

class BlockDay {
  final String day;
  final List<String> blocks;

  BlockDay(
    this.day,
    this.blocks,
  );
}
