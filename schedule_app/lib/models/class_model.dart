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

// class BlockSchedule {
//   final List<BlockClass> blockclasses;

//   BlockSchedule(this.blockclasses)
// }

class BlockClass {
  final String subject;
  final String teacher;
  final String room;

  BlockClass(
      {required this.subject, required this.teacher, required this.room});
}

// now the dwighjt schedule

class Block {
  final String letter;
  final String startTime;
  final String endTime;

  Block({required this.letter, required this.startTime, required this.endTime});
}

class BlockDay {
  final String dayName;
  final List<Block> blocks;

  BlockDay(this.dayName, this.blocks);
}

class BlockSchedule {
  final String scheduleName;
  final List<BlockDay> days;

  BlockSchedule(this.scheduleName, this.days);
}

class BUser {
  final String id;
  final Map<String, BlockClass> blockDictionary;

  BUser({required this.id, required this.blockDictionary});
}
