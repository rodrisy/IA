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
  final BlockClass ablock;
  final BlockClass bblock;
  final BlockClass cblock;

  BUser(this.id, this.ablock, this.bblock, this.cblock);
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
