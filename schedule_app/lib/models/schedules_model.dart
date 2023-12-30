import 'package:schedule_app/models/class_model.dart';

import '../main.dart';

List<User> users = [
  User(
    '0001',
    [
      Schedule(
        'Day 1',
        [
          Class('8:00', '8:55', 'Math', 'Mr. Johnson', 'Room 101'),
          Class('9:00', '9:55', 'History', 'Ms. Smith', 'Room 202'),
          Class('10:00', '10:55', 'English', 'Mrs. Brown', 'Room 303'),
          Class('11:00', '11:55', 'Lunch', '', ''),
          Class('12:00', '12:55', 'Science', 'Dr. White', 'Lab 1'),
          Class('13:00', '13:55', 'Physical Ed', 'Coach Davis', 'Gym'),
          Class('14:00', '14:55', 'Art', 'Mrs. Turner', 'Art Studio'),
        ],
      ),

      // Add more schedules for user 0001 as needed
    ],
  ),
  User(
    '0404',
    [
      // Add more schedules for user 0404 as needed
    ],
  ),
  // Add more users and their schedules as needed
];

// I HATEEEE THISSSS
List<BUser> busers = [
  BUser(
    '0001',
    BlockClass('8:00', '8:55', 'Math', 'Mr. Johnson', 'Room 101'),
    BlockClass('9:00', '9:55', 'History', 'Ms. Smith', 'Room 202'),
    BlockClass('10:00', '10:55', 'English', 'Mrs. Brown', 'Room 303'),
  ),
  BUser(
    '0002',
    BlockClass('8:00', '8:55', 'Math', 'Mr. Johnson', 'Room 101'),
    BlockClass('9:00', '9:55', 'History', 'Ms. Smith', 'Room 202'),
    BlockClass('10:00', '10:55', 'English', 'Mrs. Brown', 'Room 303'),
  ),
];
