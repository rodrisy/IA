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
  BUser(id: '0001', blockDictionary: {
    'a': BlockClass(subject: 'Econ HL', teacher: 'Jorge Ruel', room: 'M7'),
    'b': BlockClass(subject: 'Free Period or HL', teacher: '', room: ''),
    'c': BlockClass(
        subject: 'Chemistry HL', teacher: 'James Kearsley', room: '403lab'),
  }),
  BUser(
    id: '2025rsanchez',
    blockDictionary: {
      'a': BlockClass(subject: 'Econ HL', teacher: 'Jorge Ruel', room: 'M7'),
      'b': BlockClass(subject: 'Free Period or HL', teacher: '', room: ''),
      'c': BlockClass(
          subject: 'Chemistry HL', teacher: 'James Kearsley', room: '403lab'),
      'd': BlockClass(
          subject: 'Compsci HL', teacher: 'Matthew Moran', room: '501lab'),
      'e': BlockClass(
          subject: 'English SL Lang and Lit',
          teacher: 'Sarah Waldron',
          room: 'NC12'),
      'f': BlockClass(
          subject: 'ESP SL Lang and Lit',
          teacher: 'Javier Sanchez',
          room: 'Conf504 in Columbus'),
      'g': BlockClass(subject: 'Free Period or HL', teacher: '', room: ''),
      'h': BlockClass(subject: 'Microcourse', teacher: '', room: ''),
      'i': BlockClass(
          subject: 'Math SL AA', teacher: 'Summer Long', room: 'LL6'),
    },
  )
];

List<BlockSchedule> schedules = [
  // test schedyle
  BlockSchedule('testschedule1', [
    BlockDay('day 1', [
      Block(letter: 'a', startTime: '', endTime: ''),
      Block(letter: 'b', startTime: '', endTime: ''),
      Block(letter: 'c', startTime: '', endTime: ''),
      // Lunch break
      Block(letter: 'lunch', startTime: '', endTime: ''),
      Block(letter: 'd', startTime: '', endTime: ''),
      Block(letter: 'e', startTime: '', endTime: ''),
      Block(letter: 'f', startTime: '', endTime: ''),
    ])
  ]),
// 11 grade schedule
  BlockSchedule('11grade', [
    BlockDay('day 1', [
      Block(letter: 'a', startTime: '8:00', endTime: '8:55'),
      Block(letter: 'b', startTime: '9:00', endTime: '9:55'),
      Block(letter: 'c', startTime: '10:00', endTime: '10:55'),
      // Lunch break
      Block(letter: 'lunch', startTime: '11:00', endTime: '11:55'),
      Block(letter: 'd', startTime: '12:00', endTime: '12:55'),
      Block(letter: 'e', startTime: '13:00', endTime: '13:55'),
      Block(letter: 'f', startTime: '14:00', endTime: '14:55'),
    ]),
    BlockDay('day 2', [
      Block(letter: 'g', startTime: '8:00', endTime: '8:55'),
      Block(letter: 'h', startTime: '9:00', endTime: '9:55'),
      Block(letter: 'i', startTime: '10:00', endTime: '10:55'),
      // Lunch break
      Block(letter: 'lunch', startTime: '11:00', endTime: '11:55'),
      Block(letter: 'a', startTime: '12:00', endTime: '12:55'),
      Block(letter: 'b', startTime: '13:00', endTime: '13:55'),
      Block(letter: 'c', startTime: '14:00', endTime: '14:55'),
    ]),
    BlockDay('day 3', [
      Block(letter: 'd', startTime: '8:00', endTime: '8:55'),
      Block(letter: 'e', startTime: '9:00', endTime: '9:55'),
      Block(letter: 'f', startTime: '10:00', endTime: '10:55'),
      // Lunch break
      Block(letter: 'lunch', startTime: '11:00', endTime: '11:55'),
      Block(letter: 'g', startTime: '12:00', endTime: '12:55'),
      Block(letter: 'h', startTime: '13:00', endTime: '13:55'),
      Block(letter: 'i', startTime: '14:00', endTime: '14:55'),
    ]),
    BlockDay('day 4', [
      Block(letter: 'a', startTime: '8:00', endTime: '8:55'),
      Block(letter: 'b', startTime: '9:00', endTime: '9:55'),
      Block(letter: 'c', startTime: '10:00', endTime: '10:55'),
      // Lunch break
      Block(letter: 'lunch', startTime: '11:00', endTime: '11:55'),
      Block(letter: 'd', startTime: '12:00', endTime: '12:55'),
      Block(letter: 'e', startTime: '13:00', endTime: '13:55'),
      Block(letter: 'f', startTime: '14:00', endTime: '14:55'),
    ]),
    BlockDay('day 5', [
      Block(letter: 'g', startTime: '8:00', endTime: '8:55'),
      Block(letter: 'h', startTime: '9:00', endTime: '9:55'),
      Block(letter: 'i', startTime: '10:00', endTime: '10:55'),
      // Lunch break
      Block(letter: 'lunch', startTime: '11:00', endTime: '11:55'),
      Block(letter: 'a', startTime: '12:00', endTime: '12:55'),
      Block(letter: 'b', startTime: '13:00', endTime: '13:55'),
      Block(letter: 'c', startTime: '14:00', endTime: '14:55'),
    ]),
    BlockDay('day 6', [
      Block(letter: 'd', startTime: '8:00', endTime: '8:55'),
      Block(letter: 'e', startTime: '9:00', endTime: '9:55'),
      Block(letter: 'f', startTime: '10:00', endTime: '10:55'),
      // Lunch break
      Block(letter: 'lunch', startTime: '11:00', endTime: '11:55'),
      Block(letter: 'g', startTime: '12:00', endTime: '12:55'),
      Block(letter: 'h', startTime: '13:00', endTime: '13:55'),
      Block(letter: 'i', startTime: '14:00', endTime: '14:55'),
    ]),
  ])
//  12 grade schedule...
];
